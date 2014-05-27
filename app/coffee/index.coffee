gui = require 'nw.gui'

angular.module('inbox', ['ngRoute'])
.config ($routeProvider)->
  $routeProvider
  .when('/', 
    controller: 'MainCtrl'
    templateUrl: 'main.html'
  )
  .when('/inbox',
    controller: 'InboxCtrl'
    templateUrl: 'inbox.html'
  )
  .when('/calendar',
    controller: 'CalendarCtrl'
    templateUrl: 'calendar.html'
  )
  .when('/contacts',
    controller: 'ContactsCtrl',
    templateUrl: 'contacts.html'
  )
  .when('/config',
    controller: 'ConfigCtrl'
    templateUrl: 'config.html'
  )
  .otherwise
    redirectTo: '/'

.controller 'AppCtrl', ($scope)->
  $scope.closeApp = ->
    gui.App.quit()

.controller 'MainCtrl', ($scope)->
    console.log 'MainCtrl'

.controller 'InboxCtrl', ($scope, Inbox)->
  $scope.messages = Inbox.getMessages()

.controller 'CalendarCtrl', ($scope, Calendar)->
  $scope.month = Calendar.getDaysByMonth(1)

.controller 'ContactsCtrl', ($scope, Contacts)->
  $scope.contacts = Contacts.getAll()

.controller 'ConfigCtrl', ($scope)->
  console.log 'ConfigCtrl'

.factory 'Inbox', ($rootScope)->
  service = 
    messages: [
      { from: 'Burkhard', channel: 'email', body: 'Hi Keule, alles klar bei dir?', received_at: new Date() }
      { from: 'Patrick', channel: 'irc', body: 'Kaffee trinken?', received_at: new Date() }
    ]
    getMessages: ->
      return service.messages 
  return service

.factory 'Calendar', ($rootScope)->
  service =
    getDaysByMonth: (month)->
      days = for i in [1..30] by 1
        i
      return days

.factory 'Person', ($rootScope)->
  people = {
    Burkhard: {
      name: 'Burkhard'
      alias: ['Burki', 'MacCypher']
      protocols: [
        { type: 'email', value: 'maccypher@gmail.com', rel: 'home' }
        { type: 'tel', value: '+49162971010', rel: 'work' }
      ]
    }
    Patrick: {
      name: 'Patrick'
      alias: ['Mupat']
      protocols: [
        { type: 'email', value: 'dev@mupat.net', rel: 'work' }
      ]
    }
  }
  service =
    getById: (id)->
      return people[id]
  return service

.factory 'Contacts', ($rootScope, Person)->
  contacts = [
    { rate: 10, person_id: 'Burkhard'},
    { rate: 5, person_id: 'Patrick'},
  ] 
  service =
    getAll: ()->
      c = contacts.map (contact)->
        contact.person = Person.getById(contact.person_id)
        return contact
      return c
  return service


