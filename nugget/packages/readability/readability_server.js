Readability = {};

var urls = {
  authorize: 'https://www.readability.com/api/rest/v1/oauth/authorize/',
  authenticate: 'https://www.readability.com/api/rest/v1/oauth/authorize/',
  requestToken: 'https://www.readability.com/api/rest/v1/oauth/request_token/',
  accessToken: 'https://www.readability.com/api/rest/v1/oauth/access_token/'
};


Oauth.registerService('readability', 1, urls, function(oauthBinding) {
  var identity = oauthBinding.get('https://www.readability.com/api/rest/v1/users/_current/').data;

  var serviceData = {
    id: identity.username,
    first_name: identity.first_name,
    last_name: identity.last_name,
    accessToken: oauthBinding.accessToken,
    accessTokenSecret: oauthBinding.accessTokenSecret
  };

  
  return {
    serviceData: serviceData,
    options: {}
  };
});


Readability.retrieveCredential = function(credentialToken) {
  return Oauth.retrieveCredential(credentialToken);
};