Readability = {};

/*
Accounts.oauth.registerService('readability');

Meteor.loginWithReadability = function(options, callback) {
  // support a callback without options
  if (! callback && typeof options === "function") {
    callback = options;
    options = null;
  }

  var credentialRequestCompleteCallback = Accounts.oauth.credentialRequestCompleteHandler(callback);

  Readability.requestCredential(options, credentialRequestCompleteCallback);
};
*/


Readability.requestCredential = function (options, credentialRequestCompleteCallback) {
  // support both (options, callback) and (callback).
  if (!credentialRequestCompleteCallback && typeof options === 'function') {
    credentialRequestCompleteCallback = options;
    options = {};
  }

  var config = ServiceConfiguration.configurations.findOne({service: 'readability'});
  if (!config) {
    credentialRequestCompleteCallback && credentialRequestCompleteCallback(new ServiceConfiguration.ConfigError("Service not configured"));
    return;
  }

  var credentialToken = Random.id();
  // We need to keep credentialToken across the next two 'steps' so we're adding
  // a credentialToken parameter to the url and the callback url that we'll be returned
  // to by oauth provider

  // url back to app, enters "step 2" as described in
  // packages/accounts-oauth1-helper/oauth1_server.js
  var callbackUrl = Meteor.absoluteUrl('_oauth/readability?close&state=' + credentialToken);

  var url = '/_oauth/readability/?requestTokenAndRedirect='
        + encodeURIComponent(callbackUrl)
        + '&state=' + credentialToken;

  Oauth.initiateLogin(credentialToken, url, credentialRequestCompleteCallback);

};