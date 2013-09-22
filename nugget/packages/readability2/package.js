Package.describe({
  summary: "Login service for Readability accounts"
});

Package.on_use(function(api) {
  api.use('oauth', ['client', 'server']);
  api.use('oauth2', ['client', 'server']);
  api.use('http', ['client', 'server']);
  api.use('templating', 'client');
  api.use('service-configuration', ['client', 'server']);

  api.export('Readability');

  /*
  api.add_files(
    ['readability_configure.html', 'readability_configure.js'],
    'client');
  */

  api.add_files('readability_common.js', ['client', 'server']);
  api.add_files('readability_server.js', 'server');
  api.add_files('readability_client.js', 'client');
});
