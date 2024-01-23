@master
@core
@regression
@rock
Feature: Checking my portfolio site is up and running using API call

Background:
  * url baseurlConfig

  @smoke
  Scenario Outline: Create a post and then get it by id
    * def postdata =
      """
      {
				"title": "<title>",
				"content": "<postcontent>"
				}
      """

    Given path 'addPost'
    And request postdata
    When method post
    Then status 200

    * def idValue = response.insertedId
    * def ack = response.acknowledged
    * print 'Ack is: ', ack
    * match ack == true
    * print 'Created id is: ', idValue

    And path 'getPost'
    And param id = idValue
    When method get
    Then status 200
    And match response.title == "<title>"
    And match response.content == "<postcontent>"
    Examples:
    | title     | postcontent |
    | selenium  | Selenium is first in the list |
    | karateapi | KarateAPI is on third | 
    | cypress | cypress is on second | 
    
  @smoke
  Scenario: Get all the post and then get the first user by id
    Given path 'getPosts'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'getPost'
    And param id = first.id
    When method get
    Then status 200
    And print 'Response is: ', response
	
	
	@smoke
  Scenario: Create a post and then get it by id using the JSON Headers and reading JSON file
     Given path 'addPost'
    * configure headers = { 'Content-Type': 'application/json' }
   	* json jsonCreateUser = read('../data/createPost.json')
    * print karate.pretty(jsonCreateUser)
    * request jsonCreateUser
    When method post
    Then status 200

    * def idValue = response.insertedId
    * def ack = response.acknowledged
    * print 'Ack is: ', ack
    * match ack == true
    * print 'Created id is: ', idValue

    And path 'getPost'
    And param id = idValue
    When method get
    Then status 200
    And match response.title == jsonCreateUser.title
    And match response.content == jsonCreateUser.content

  @smoke
  @regressionChecking
  @mani
  Scenario: OAUTH and OAUTH2.0 - https://authorization-server.com/
 
* url 'https://authorization-server.com/authorize?response_type=code&client_id=nAvGpY9lnNWbWxAQ-oC88mYV&redirect_uri=https://www.oauth.com/playground/authorization-code.html&scope=photo+offline_access&state=_tbpMAFLonX2UgFZ'
* path 'token'
* form field grant_type = 'password'
* form field client_id = 'nAvGpY9lnNWbWxAQ-oC88mYV'
* form field client_secret = 'w4Nfbi_r-uEWGJfbVb0RnW01FHsNRCJnazSUtqSD6d0MtI8R'
* form field username = 'uninterested-mouse@example.com'
* form field password = 'Cooperative-Goosander-10'
* method post
* status 200

* def accessToken = response.access_token

* path 'resource'
* header Authorization = 'Bearer ' + accessToken
# * param access_token = accessToken
* method get
* status 200 
* print accessToken 

#client_id	nAvGpY9lnNWbWxAQ-oC88mYV
#client_secret	w4Nfbi_r-uEWGJfbVb0RnW01FHsNRCJnazSUtqSD6d0MtI8R

#User Account
#login	uninterested-mouse@example.com
#password	Cooperative-Goosander-10
 		