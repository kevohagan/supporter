Meteor.publish "needs", ->
  Needs.find {completedAt: {$exists: false}}, sort: {createdAt: -1}

Meteor.publish "offers", ->
  if @userId
    return Offers.find {userId: @userId}
  else
    return @.stop()