# These values get propagated through the app
# E.g. The 'name' and 'subtitle' are used in seo.coffee

@Config =

	# Basic Details
	name: 'Jack UI'
	title: ->
			TAPi18n.__ 'configTitle'
	subtitle: ->
			TAPi18n.__ 'configSubtitle'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()

	# Emails
	emails:
		from: 'no-reply@' + Meteor.absoluteUrl()
		contact: 'hello' + Meteor.absoluteUrl()

	# Username - if true, users are forced to set a username
	username: false
	
	# Localisation
	defaultLanguage: 'en'
	dateFormat: 'D/M/YYYY'

	# Meta / Extenrnal content
	privacyUrl: 'http://meteorfactory.io'
	termsUrl: 'http://meteorfactory.io'

	# For email footers
	legal:
		address: 'Jessnerstrasse 18, 12047 Berlin'
		name: 'Meteor Factory'
		url: 'http://benjaminpeterjones.com'

	about: 'http://bradbazemore.com'
	blog: 'http://learn.meteorfactory.io'

	socialMedia:
		twitter:
			url: 'http://twitter.com/bwbaze'
			icon: 'twitter'
		github:
			url: 'http://github.com/sonyccd'
			icon: 'github'
		info:
			url: 'http://bradbazemore.com'
			icon: 'link'

	#Routes
	homeRoute: '/'
	publicRoutes: ['home']
	dashboardRoute: '/dashboard'