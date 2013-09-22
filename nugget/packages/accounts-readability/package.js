Package.describe({
  summary: "Accounts service for Readability accounts"
});

Package.on_use(function(api) {
  api.use('accounts-base', ['client', 'server']);
  api.use('accounts-oauth', ['client', 'server']);
  api.use('readability', ['client', 'server']);

  // v0.6.5
  // Export Accounts (etc) to packages using this one.
  api.imply('accounts-base', ['client', 'server']);

  //api.add_files(['linkedin_login_button.css'], 'client');

  api.add_files('readability_common.js', ['client', 'server']);
  //api.add_files('readability_server.js', 'server');
  api.add_files('readability_client.js', 'client');
});