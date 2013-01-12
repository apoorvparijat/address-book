AddressBook.Views.Contacts ||= {}

class AddressBook.Views.Contacts.ContactView extends Backbone.View
  template: JST["backbone/templates/contacts/contact"]

  events:
    "click .destroy" : "destroy"
    "click" : "highlight"

  tagName: "tr"

  destroy: () ->
    if(!confirm("Are you sure you want to delete this contact?"))
      return
    $("#contact-details").fadeOut()
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

  highlight: ->
    @contact = @model.toJSON()
    $("#contact-details").show()
    $(".contact-name").text(@contact.name)
    $(".email").text(@contact.email)
    $(".phone").text(@contact.phone)
    $(".address").text(@contact.address)
    $(".company").text(@contact.company)