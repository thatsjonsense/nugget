

Meteor.startup ->

    texts = 
      'blast_shack': 
        author: 'Bruce Sterling'
        source: 'https://medium.com/p/f745f5fbeb1c'
        title: 'The Blast Shack'

      'krulwich_commencement':
        author: 'Robert Krulwich'
        source: 'http://blogs.discovermagazine.com/notrocketscience/2011/05/12/there-are-some-people-who-dont-wait-robert-krulwich-on-the-future-of-journalism/'
        title: 'Commencement Speech at Berkeley May 7, 2011'

      'hamlet':
        author: 'William Shakespeare'
        source: 'http://www.gutenberg.org/ebooks/1524'
        title: 'The Tragedy of Hamlet, Prince of Denmark'

      'heart_of_darkness':
        author: 'Joseph Conrad'
        source: ''
        title: 'Heart of Darkness'

      'benham':
        author: 'Kelley Benham'
        source: 'http://www.tampabay.com/news/health/medicine/parents-of-micro-preemie-face-heart-wrenching-decisions/1264963?src=longreads&buffer_share=8b7ec'
        title: 'Never Let Go'

      'kevinkelly':
        author: 'Kevin Kelly'
        source: 'http://www.kk.org/thetechnium/archives/2013/01/the_post-produc.php'
        title: 'The Post-Productive Economy'

      'mlkdream':
        author: 'Rev. Martin Luther King, Jr.'
        source: ''
        title: 'I Have a Dream'

      'socialnetwork':
        author: 'Zadie Smith'
        source: 'http://www.nybooks.com/articles/archives/2010/nov/25/generation-why/?pagination=false'
        title: 'Generation Why?'

      'stevejobs':
        author: 'Steve Jobs'
        source: 'http://news.stanford.edu/news/2005/june15/jobs-061505.html'
        title: 'Stanford Commencement Address'

      'gervais':
        author: 'Venkatesh Rao'
        source: 'http://www.ribbonfarm.com/2009/10/07/the-gervais-principle-or-the-office-according-to-the-office/'
        title: 'The Gervais Principle, or the Office according to "The Office"'


    for name, text of texts
      text.body = Assets.getText("mock_data/#{name}.html")
      text.name = name
      Articles.findOrInsert text

