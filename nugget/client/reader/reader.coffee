Template.reader.article = ->
  name = Session.get('viewing_article')
  @article = Articles.findOne {name: name}
  return @article

Template.reader.rendered = ->

  name = Session.get('viewing_article')
  article = Articles.findOne {name: name}

  if article
    a = new Annotater(article, @find('.text'))

    Deps.autorun =>
      a.showHighlights()






###
Session.setDefault('user_id',Meteor.uuid())



@showScrollers = ->
  scrollers = Positions.find().fetch()

@updateScroller = ->
  
  p = $('p:in-viewport').slice(1,2)
  $('.highlighted').removeClass('highlighted')
  p.addClass('highlighted')

  user_id = Session.get('user_id')
  position = p.text()[..25]

  if not Positions.findOne {_id: user_id}
    Positions.insert {_id: user_id}

  Positions.update user_id, {position: position, text: p.text()}

  #Session.set('current_paragraph',p.text())


Template.reader.rendered = ->

  $(window).scroll updateScroller
###