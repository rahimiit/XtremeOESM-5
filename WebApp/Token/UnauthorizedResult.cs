using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;

namespace WebApp.Token
{
    public class UnauthorizedResult : IHttpActionResult
    {
        public UnauthorizedResult(AuthenticationHeaderValue authHeaderValue,IHttpActionResult innerResult)
        {
            AuthHeaderValue = authHeaderValue;
            InnerResult = innerResult;
        }
        public AuthenticationHeaderValue AuthHeaderValue { get; set; }
        public IHttpActionResult InnerResult { get; set; }
        public async Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            HttpResponseMessage response = await InnerResult.ExecuteAsync(cancellationToken);
            if(response.StatusCode==HttpStatusCode.Unauthorized)
            {
                if(response.Headers.WwwAuthenticate.All(h=>h.Scheme!=AuthHeaderValue.Scheme))
                {
                    response.Headers.WwwAuthenticate.Add(AuthHeaderValue);
                }
            }
            return response;
        }
    }
}