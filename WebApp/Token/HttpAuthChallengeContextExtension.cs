using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;
using System.Net.Http.Headers;


namespace WebApp.Token
{
    public static class HttpAuthChallengeContextExtension
    {
        public static void ChallengeWith(this HttpAuthenticationChallengeContext context,string scheme)
        {
            ChallengeWith(context, new AuthenticationHeaderValue(scheme));
        }
        public static void ChallengeWith(this HttpAuthenticationChallengeContext context, string scheme,string parameter)
        {
            ChallengeWith(context, new AuthenticationHeaderValue(scheme,parameter));
        }
        public static void ChallengeWith(this HttpAuthenticationChallengeContext context, AuthenticationHeaderValue challenge )
        {
            if(context==null)
            {
                throw new ArgumentNullException(nameof(context));
            }
            context.Result = new UnauthorizedResult(challenge, context.Result);
        }
    }
}