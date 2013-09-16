


@Articles = new Meteor.Collection('articles')
@Streams = new Meteor.Collection('streams')

@Highlights = new Meteor.Collection('highlights')
@Comments = new Meteor.Collection('comments')




@Reads = new Meteor.Collection('reads')
###
  user_id: 1
  article_id: 1
  status: [null or 'reading' or 'done']
###
