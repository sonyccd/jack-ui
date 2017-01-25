@Missions = new Meteor.Collection('missions')

Schemas.Missions = new SimpleSchema(
  name:
    type:String

  owner:
    type:String
    regEx:SimpleSchema.RegEx.Id
    autoValue:->
      if this.isInsert
        Meteor.userId()
    autoform:
      options:->
        _.map Meteor.users.find().fetch(), (user)->
          label:user.emails[0].address
          value:user._id
)

Missions.attachSchema(Schemas.Missions)

Missions.helpers
  author: ->
    user = Meteor.users.findOne(@owner)
    if user?.profile?.firstName? and user?.profile?.lastName
      user.profile.firstName + ' ' + user.profile.lastName
    else
      user?.emails?[0].address