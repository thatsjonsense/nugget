Meteor.Router.add

  '': 'list'

  '/:story': (name) ->
    Session.set('viewing_article',name)
    return 'reader'

Meteor.Router.beforeRouting = -> 
  Session.set('viewing_article',null)