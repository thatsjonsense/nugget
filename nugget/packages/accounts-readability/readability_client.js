Meteor.loginWithReadability = function (options, callback) {
  var credentialRequestCompleteCallback = Accounts.oauth.credentialRequestCompleteHandler(callback);
  Readability.requestCredential(options, credentialRequestCompleteCallback);
};