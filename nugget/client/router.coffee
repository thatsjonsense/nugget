Meteor.Router.add

  '/:story': (name) ->
    Session.set('viewing_story',name)
    return 'reader'

Meteor.Router.beforeRouting = -> 
  Session.set('viewing_story',null)