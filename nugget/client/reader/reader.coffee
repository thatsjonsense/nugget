Template.reader.title = ->
  "The title!"

Template.reader.text = ->
  #"The text!"
  Template.text_bruce()




# Scroll position
##################

Session.setDefault('user_id',Meteor.uuid())


@onScroll = ->
  

  p = $('p:in-viewport').slice(1,2)

  $('.highlighted').removeClass('highlighted')
  p.addClass('highlighted')


  Session.set('current_paragraph',p.text())


Template.reader.rendered = ->

  $(window).scroll onScroll