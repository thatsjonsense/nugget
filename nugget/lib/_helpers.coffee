
# Logging
@print = console.log

@prettify = (stuff) ->
  JSON.stringify(stuff,null,2)

# Models
_.extend Meteor.Collection.prototype,
  upsert: (obj) -> @findOne(obj) ? @findOne(@insert(obj))
