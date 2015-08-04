Meteor.methods
  requestConsult: (email, text) ->
    check([email, text], [String])
    @unblock()
    Email.send
      to: "sergey.petrov@me.com"
      from: "robot@sergeypetrov.ru"
      subject: "Запрос консультации от #{email}"
      text: text
