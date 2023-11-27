using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;

namespace WebApp.Token
{
    public class JwtAuthManager
    {
        public const string SecretKey = "JIOBLi6eVjBpvGtWBgJzjWd2QH0sOn5tI8rIFXSHKijXWEt/3J2jFYL79DQ1vKu+EtTYgYkwT1uFRDdtF41yAQ==";
        public static string GenerateJWTToken(string username,int expire_in_Minutes = 30)
        {
            var symmetric_key = Convert.FromBase64String(SecretKey);
            var token_Handler = new JwtSecurityTokenHandler();
            var now = DateTime.UtcNow;
            var securitytokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.Name,username)
                 }),
                Expires = now.AddMinutes(Convert.ToInt32(expire_in_Minutes)),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(symmetric_key), SecurityAlgorithms.HmacSha256Signature)
            };

            var stoken = token_Handler.CreateToken(securitytokenDescriptor);
            var token = token_Handler.WriteToken(stoken);
            return token;
        }


        public static ClaimsPrincipal GetPrinciple(string token)
        {
            try
            {
                var jwtTokenHandler = new JwtSecurityTokenHandler();
                var jwtToken = jwtTokenHandler.ReadJwtToken(token) as JwtSecurityToken;
                if (jwtToken == null)
                {
                    return null;
                }

                var symmetricKey = Convert.FromBase64String(SecretKey);
                var validationParameters = new TokenValidationParameters
                {
                    RequireExpirationTime = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(symmetricKey)
                };

                SecurityToken securityToken;
                var principle = jwtTokenHandler.ValidateToken(token, validationParameters, out securityToken);
                return principle;
            }
            catch(Exception e)
            {
                return null;
            }
        }
    }
}