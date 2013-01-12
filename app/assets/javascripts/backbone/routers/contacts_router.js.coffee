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
    t = this
    t.adjust()
    @view = new AddressBook.Views.Contacts.IndexView(contacts: @contacts)
    $("#contacts").html(@view.render().el)
    $(window).resize ->
      t.adjust()

  adjust: ->
    if($(window).width() < 950)
      $("body").addClass("responsive")
      $(".increase-height").show();
      $("#contact-details").css("bottom","-200px")
      $("#contact-details").hover( 
        -> $(this).animate({bottom: "20px"},300)
        -> $(this).stop().css("bottom","-200px")
        )
    else
      $(".increase-height").hide();
      $("body").removeClass("responsive")
      $("#contact-details").unbind("hover").css("bottom","auto")

  show: (id) ->
    contact = @contacts.get(id)

    @view = new AddressBook.Views.Contacts.ShowView(model: contact)
    $("#contacts").html(@view.render().el)

  edit: (id) ->
    contact = @contacts.get(id)

    @view = new AddressBook.Views.Contacts.EditView(model: contact)
    $("#contacts").html(@view.render().el)
