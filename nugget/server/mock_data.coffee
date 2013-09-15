

Meteor.startup ->

  if Articles.find().count() == 0

    texts = 
      'blast_shack': 
        author: 'Bruce Sterling'
        source: 'https://medium.com/p/f745f5fbeb1c'
        title: 'The Blast Shack'

      'krulwich_commencement':
        author: 'Robert Krulwich'
        source: 'http://blogs.discovermagazine.com/notrocketscience/2011/05/12/there-are-some-people-who-dont-wait-robert-krulwich-on-the-future-of-journalism/'
        title: 'Commencement Speech at Berkeley May 7, 2011'

    for name, text of texts
      text.body = Assets.getText("mock_data/#{name}.html")
      text.name = name
      Articles.insert text

