addOffer = ->
  user = Meteor.user()
  if user and user.username
    newOffer = $('#newOffer').val()
    if newOffer.length > 30
      $('#newOffer').val ''
      Offers.insert
        content: newOffer
        createdAt: new Date()
        userId: user._Id
        username: user.username
        needId: Session.get('editing_itemname')
    else
      alert 'Be more descriptive'

Template.newOffer.events
  "click input#newOfferButton": ->
    addOffer()
    Session.set('editing_itemname',null)

  "keypress input#newOffer": (evt) ->
    addOffer() if evt.which is 13