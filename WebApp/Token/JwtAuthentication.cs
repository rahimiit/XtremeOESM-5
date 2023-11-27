using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;
using apps.Services;

namespace WebApp.Token
{
    public class JwtAuthentication : Attribute, IAuthenticationFilter
    {
        public string Realm { get; set; }
        public bool AllowMultiple => false;


        public async Task AuthenticateAsync(HttpAuthenticationContext context, CancellationToken cancellationToken)
        {

            var request = context.Request;
            var authorization = request.Headers.Authorization;
            if (authorization == null || authorization.Scheme != "Bearer" || string.IsNullOrEmpty(authorization.Parameter))
            {
                context.ErrorResult = new AuthFailureResult("JWT Token is Missing", request);
            }
            var token = authorization.Parameter;
            var principle = await AuthJwtToken(token);
            if (principle == null)
            {
                context.ErrorResult = new AuthFailureResult("Invalid JWT token", request);
            }
            else
            {
                context.Principal = principle;
            }
        }


        private static bool ValidateToken(string token,out string username)
        {
            username = null;
            var simplePrinciple = JwtAuthManager.GetPrinciple(token);
            if (simplePrinciple == null)
               return false;
            var identity = simplePrinciple.Identity as ClaimsIdentity;
            if (identity == null)
                return false;
            if (!identity.IsAuthenticated)
                return false;
            var usernameClaim = identity.FindFirst(ClaimTypes.Name);
            username = usernameClaim?.Value;
            if (string.IsNullOrEmpty(username))
                return false;

            return true;
        }

        protected Task<IPrincipal> AuthJwtToken(string token)
        {
            string username;
            if(ValidateToken(token,out username))
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name,username)
                };
                var identity = new ClaimsIdentity(claims, "Jwt");
                IPrincipal user = new ClaimsPrincipal(identity);
                return Task.FromResult(user);
            }
            return Task.FromResult<IPrincipal>(null);
        }
        public Task ChallengeAsync(HttpAuthenticationChallengeContext context, CancellationToken cancellationToken)
        {
            Challenge(context);
            return Task.FromResult(0);
        }


        private void Challenge(HttpAuthenticationChallengeContext context)
        {
            string parameter = null;
            if (!string.IsNullOrEmpty(Realm))
                parameter = "realm=\"" + Realm + "\"";
            context.ChallengeWith("Bearer", parameter);
        }
    }
}