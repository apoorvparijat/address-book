AddressBook.Views.Contacts ||= {}

class AddressBook.Views.Contacts.IndexView extends Backbone.View
  template: JST["backbone/templates/contacts/index"]

  initialize: () ->
    @options.contacts.bind('reset', @addAll)

  addAll: () =>
    @options.contacts.each(@addOne)

  addOne: (contact) =>
    view = new AddressBook.Views.Contacts.ContactView({model : contact})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(contacts: @options.contacts.toJSON() ))
    @addAll()

    return this
