Feature: POST call - Adding user and fetch the same using GET request 

  Background:
    * url baseurlConfig1
	
	@sanity
  Scenario: Get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200
    
    
	@sanity
  Scenario Outline: create a user and then get it by id
    * text user =
      """
      {
        "name": "<name>",
        "username": "<name>",
        "email": "<name>@user.com",
        "address": {
          "street": "Has No Name",
          "suite": "Apt. 123",
          "city": "Electri",
          "zipcode": "54321-6789"
        }
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id
  Examples:
  | name   | 
  | 'Manikandan'  |
  | 'Ravi' |
  | 'Priya' | 
  | 'Teja' |
  | 'Rekha' |
  | 'Ragha' |
  | 'Chang' |
  
 
 Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and OK
  
  * url 'https://reqres.in/'
 	* def baseURL = 'https://reqres.in/'
 	* configure report = { showLog: true, showAllSteps: true }
  
    Given path 'api/users'
    When param page = 2
    And method GET
    Then status 200
 		And print "Site is up and running"
 		* print response
 
  @smoke
  @regressionChecking
  @GETMethod
  Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and valdiating the response
    
    Given url 'https://reqres.in/'
    And path 'api/users'
    When path '7'
    And method GET
    Then status 200       #Status Code 200-ok, 404 - issue, 400 - issue, 500 - issue
 		And print "Site is up and running"
 		And print response
 		And print karate.pretty(response)
    * def responseJson =
    """
			     {
			  "data": {
			    "id": 7,
			    "email": "michael.lawson@reqres.in",
			    "first_name": "Michael",
			    "last_name": "Lawson",
			    "avatar": "https://reqres.in/img/faces/7-image.jpg"
			  },
			  "support": {
			    "url": "https://reqres.in/#support-heading",
			    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
			  }
			}
			"""
    And match responseJson.data.id == response.data.id
    And match responseJson == response
  