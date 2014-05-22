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

.controller 'MainCtrl', ($scope)->
  console.log 'MainCtrl'

.controller 'InboxCtrl', ($scope)->
  console.log 'InboxCtrl'

.controller 'CalendarCtrl', ($scope)->
  console.log 'CalendarCtrl'

.controller 'ContactsCtrl', ($scope)->
  console.log 'ContactsCtrl'

.controller 'ConfigCtrl', ($scope)->
  console.log 'ConfigCtrl'

