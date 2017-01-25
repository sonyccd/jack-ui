Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"

  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'robots'
        subs.subscribe 'comments'
        subs.subscribe 'attachments'
      ]
    data: ->
      #find gets data from mongo and fetch returns as array for blaze to render
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()
      robots: Robots.find().fetch()