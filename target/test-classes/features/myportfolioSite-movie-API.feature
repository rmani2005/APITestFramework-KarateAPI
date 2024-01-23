@master
@core
@regression
@rock
Feature: Checking my portfolio site is up and running using API call

Background:
  * url baseurlConfig

  @smoke
  Scenario: Get all the movie posts and then get the first user by id
    Given path 'movies'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'getPost'
    And param id = first.id
    When method get
    Then status 200
    And print 'Response is: ', response
     
  @smoke
  Scenario: Get all the movie posts
    Given path 'movies'
    When method get
    Then status 200
    And print 'Response is: ', response

	
	
 		