Template.need.rendered = ->
  $('a').tooltip
    placement: 'bottom'
  $('a').on('click', ->
    $(@).tooltip('destroy')
  )

Template.need.helpers
  offers: ->
    Offers.find(
      {needId: @_id},
      {sort: { createdAt: -1 }}
    )

  owner: ->
    Meteor.user() && Meteor.user().username == @username

Template.need.events
  'click .delete': (event)->
    Needs.remove(@_id)
    Router.go('/')

  'click .complete': (event)->
    Needs.update(@_id, $set: {completedAt: new Date()})
    Router.go('/')

  "click .respond": (event, template)->
    Session.set('respondingTo', @_id)
    Session.set('charsOffer', null)
    $(template.find('.newOffer')).modal()

  "click .send": (event, template)->
    Session.set('sendingTo', @_id)
    $(template.find('.sendNeed')).modal()

