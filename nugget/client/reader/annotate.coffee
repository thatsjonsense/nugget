class @Annotater

  # root node of the DOM structure we're messing with
  constructor: (@article, @root) ->
    @setup()

  setup: ->

    # Break into chunks
    chunks = $(@root).find('p')
    chunks.attr 'chunk-index', (i) -> i


    # Register events on each chunk
    article_id = @article._id

    chunks.click ->

      highlight = 
        user_id: Meteor.userId()
        article_id: article_id 
        chunk: $(@).attr('chunk-index') 

      Highlights.insert highlight
        
  highlight: ->

    # Get Highlights

    highlights = Highlights.find
      article_id: @article._id
    .fetch()

    for h in highlights
      $("[chunk-index=#{h.chunk}]").addClass('highlighted')