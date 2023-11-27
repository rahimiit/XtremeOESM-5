﻿using System;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
namespace WebApp.Token
{
    public class AuthFailureResult : IHttpActionResult
    {
        public AuthFailureResult(string reasonPhrase,HttpRequestMessage request)
        {
            ReasonPhrase = reasonPhrase;
            Request = request;

        }

        public string ReasonPhrase { get; set; }
        public HttpRequestMessage Request { get; set; }

        public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            return Task.FromResult(Execute());
        }
        private HttpResponseMessage  Execute()
        {
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.Unauthorized)
            {
                RequestMessage = Request,
                ReasonPhrase = ReasonPhrase
            };
            return response;
        }
    }
}