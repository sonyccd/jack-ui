@Robots = new Meteor.Collection('robots')

Schemas.Robots = new SimpleSchema(
  name:
    type:String

  rosip:
    label:"ROS IP Address"
    type:String

  topics:
    type:Object
    optional:true

  "topics.imu":
    label:"IMU"
    type:String

  "topics.gps":
    label:"GPS"
    type:String

  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id
)

Robots.attachSchema(Schemas.Robots)

Robots.helpers
  author: ->
    user = Meteor.users.findOne(@owner)
    if user?.profile?.firstName? and user?.profile?.lastName
      user.profile.firstName + ' ' + user.profile.lastName
    else
      user?.emails?[0].address