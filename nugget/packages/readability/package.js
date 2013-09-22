Package.describe({
  summary: "Readability OAuth flow",
});

Package.on_use(function(api) {
  api.use('http', ['client', 'server']);
  api.use('templating', 'client');
  api.use('oauth1', ['client', 'server']);
  api.use('oauth', ['client', 'server']);
  api.use('random', 'client');
  api.use('underscore', 'server');
  api.use('service-configuration', ['client', 'server']);

  api.use('accounts-base', ['client', 'server']);
  api.imply('accounts-base', ['client', 'server']);
  api.use('accounts-oauth', ['client', 'server']);

  api.export('Readability');

  /*
  api.add_files(
    ['twitter_configure.html', 'twitter_configure.js'],
    'client');
  */
  api.add_files('readability_server.js', 'server');
  api.add_files('readability_client.js', 'client');

});