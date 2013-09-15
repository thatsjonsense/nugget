@templateHelpers =
  icon: (path) ->
    "<img class='icon' src='/icons/black, without circle/#{path}' />"


for name, helper of templateHelpers
  Handlebars.registerHelper(name,helper)