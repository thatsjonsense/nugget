Template.reader.article = ->
  name = Session.get('viewing_article')
  @article = Articles.findOne {name: name}
  return @article

Template.reader.rendered = ->

  name = Session.get('viewing_article')
  article = Articles.findOne {name: name}

  if article
    A = new Annotater(article, @find('.text'))
    P = new PositionTracker(article)

    $(document).scroll ->
      _.throttle P.updatePosition(), 500


    Deps.autorun =>

      # Annotations
      A.showHighlights()


      # Reading positions
      positions = _.reject P.allPositions(), (p) -> p.user_id == Meteor.userId()

      heads = d3.select(@find('.positions'))
        .selectAll('.head')
        .data(positions)

      heads.enter()
        .append('div')
        .attr('class','head')
        .html((d) -> Template.reader_position_head())

      heads.exit()
        .remove

      heads.select('img')
        .attr 'src', (d) ->
          if user = Meteor.users.findOne(d.user_id)
            picture = user.profile.picture
          else
            picture = 'http://ts2.mm.bing.net/th?id=H.4524186546209105&w=214&h=188&c=7&rs=1&pid=1.7'

      heads.transition().duration(500).ease('cubic-out')
        .style 'top', (d) -> 
          d.position + 'px'





Template.reader.events
  'click .skim': ->
    $('article').toggleClass('skim')


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