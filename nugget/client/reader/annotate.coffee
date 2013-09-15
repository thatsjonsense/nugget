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


    A = @
    chunks.click ->
      A.saveHighlight(@)
      
        

  saveHighlight: (node) ->

    highlight = 
      user_id: Meteor.userId()
      article_id: @article._id
      text: $(node).text()
      chunk: $(node).attr('chunk-index') 

    Highlights.insert highlight


  showHighlights: ->

    highlights_all = Highlights.find
      article_id: @article._id
    .fetch()

    for chunk, highlights of _.groupBy(highlights_all, (h) -> h.chunk)
      $("[chunk-index=#{chunk}]").attr('highlights',highlights.length)