class AddressBook.Models.Contact extends Backbone.Model
  paramRoot: 'contact'

  defaults:
    name: null
    address: null
    phone: null
    email: null
    company: null

class AddressBook.Collections.ContactsCollection extends Backbone.Collection
  model: AddressBook.Models.Contact
  url: '/contacts'
