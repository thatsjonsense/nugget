Template.nuggets.highlights = ->
  highlights = Highlights.find
    user_id: Meteor.userId()
  .fetch()

  for h in highlights
    h.article = Articles.findOne h.article_id

  return highlights