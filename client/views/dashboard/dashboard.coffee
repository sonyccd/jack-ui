#TODO i am sure this is not how you should be setting up multible modal buttons

Template.addPostBtn.events
  'click':->
    Modal.show('postModal')

Template.addPost.events
  'submit':->
    Modal.hide('postModal')

Template.addRobotBtn.events
  'click': ->
    Modal.show('robotModal')