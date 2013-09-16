class @PositionTracker

  offset: 100

  constructor: (@article) ->
    @id = Reads.findOrInsert
      user_id: Meteor.userId()
      article_id: @article._id
    ._id

  getPosition: ->
    $(document).scrollTop() + @offset

  allPositions: ->
    Reads.find
      article_id: @article._id
    .fetch()

  updatePosition: ->

    p = @getPosition()

    Reads.update @id,
      $set:
        position: p