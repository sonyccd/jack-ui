# TODO not loading posts and comments anymore need to fix that
@AdminConfig =
	name: Config.name
	collections:
    Robots:
      color: 'green'
      icon: 'rocket'
      tableColumns: [
        {label:'Robot Name', name:'name'}
        {label:'ROS IP', name:'rosip'}
      ]
		Posts:
			color: 'red'
			icon: 'pencil'
			extraFields: ['owner']
			tableColumns: [
				{ label: 'Title', name: 'title' }
				{ label: 'User', name: 'author()', template: 'adminUserCell' }
			]
		Comments:
			color: 'orange'
			icon: 'comments'
			extraFields: ['doc', 'owner']
			tableColumns: [
				{ label: 'Content', name: 'content' }
				{ label: 'Post', name: 'docTitle()', template: 'adminPostCell' }
				{ label: 'User', name: 'author()', template: 'adminUserCell' }
			]
			children: [
				{
					find: (comment) ->
						Posts.find comment.doc, limit: 1
				}
				{
					find: (comment) ->
						Meteor.users.find comment.owner, limit: 1
				}
			]
	dashboard:
		homeUrl: '/dashboard'
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
