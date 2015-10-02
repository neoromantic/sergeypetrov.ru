Template.consultModal.onRendered ->
	Session.set "canSubmit", false
	@$('.modal').modal
		detachable: false
		onShow: ->
			analytics?.page "consult"
		onDeny: ->
			analytics?.track "home"
		onApprove: =>
			email = @$('[name="email"]').val()
			text = @$('[name="description"]').val()
			Meteor.call 'requestConsult', email, text

Template.ticker.onCreated ->
	@subscribe 'BTCCurrent'

Template.ticker.helpers

	ticker: -> BTC.findOne()

Template.consultModal.helpers

	canSubmit: -> Session.get "canSubmit"

Template.consultModal.events
	'keyup input, keyup textarea': ->
		Session.set "canSubmit", _.every $('input[type="text"],textarea'), (el) -> $(el).val().length > 0

Template.home.onRendered ->
	analytics?.page('home')

	$('.footer').visibility
		once: false
		continuous: true
		onTopVisible: (calc) ->
			alpha = ($(window).height() + $(document).scrollTop() - calc.top)/calc.height
			alpha = if alpha < 0 then 0 else alpha
			color = "rgba(0,0,0,#{alpha})"
			$('body').css 'background-color', color

		onTopVisibleReverse: -> $('body').css 'background-color', 'white'

Template.home.events
	'click .freeConsult': -> $('.modal').modal('show')
