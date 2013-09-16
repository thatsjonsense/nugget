class @PositionTracker


  constructor: (@article) ->
    @id = Reads.findOrInsert
      user_id: Meteor.userId()
      article_id: @article._id
    ._id

  getPosition: ->
    $(document).scrollTop()

  updatePosition: ->

    p = @getPosition()

    Reads.update @id,
      $set:
        position: p