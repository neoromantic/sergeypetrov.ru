Template.cases.onCreated ->
	@selectedCase = new ReactiveVar(false)

Template.cases.helpers

	selectedCase: -> Template.instance().selectedCase.get()

Template.cases.events

	'click .showCase .back.button': (ev, tpl) ->
		tpl.$('.caseList').show()#;transition('fade in')
		tpl.$('.showCase').hide()#transition('fade out')
		tpl.selectedCase.set false

	'click .case': (ev, tpl) ->
		tpl.$('.caseList').hide()#transition('fade out')
		tpl.$('.showCase').show()#transition('fade in')
		tpl.selectedCase.set @
