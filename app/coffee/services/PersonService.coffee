
class PersonService

  constructor: (@$rootScope)->
    @persons = {}

  getPersonById: (id)->
    return @persons[id]

  getAllPersons: ()->
    return @persons

module.exports = PersonService