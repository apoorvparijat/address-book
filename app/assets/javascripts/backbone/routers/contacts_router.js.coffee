class AddressBook.Routers.ContactsRouter extends Backbone.Router
  initialize: (options) ->
    @contacts = new AddressBook.Collections.ContactsCollection()
    @contacts.reset options.contacts

  routes:
    "new"      : "newContact"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newContact: ->
    @view = new AddressBook.Views.Contacts.NewView(collection: @contacts)
    $("#contacts").html(@view.render().el)

  index: ->
    @view = new AddressBook.Views.Contacts.IndexView(contacts: @contacts)
    $("#contacts").html(@view.render().el)

  show: (id) ->
    contact = @contacts.get(id)

    @view = new AddressBook.Views.Contacts.ShowView(model: contact)
    $("#contacts").html(@view.render().el)

  edit: (id) ->
    contact = @contacts.get(id)

    @view = new AddressBook.Views.Contacts.EditView(model: contact)
    $("#contacts").html(@view.render().el)
