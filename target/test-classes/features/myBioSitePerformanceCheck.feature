#Author: rmani2005@gmail.com

@master
@core
@regression

Feature: This is a feature to check my bio site up and running - https://manikandanravi.in/api/hello

Background:
 	* configure report = { showLog: true, showAllSteps: true }
 	* url baseurlConfig
 	
  @smoke
  @regressionChecking
  @mani
  Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and OK
    Given path 'getPosts'
    When method GET
    Then status 200
 		And print response
 		And print karate.pretty(response)
 	#	And match response.name == "John Doe"
      
  @smoke
  @currentRun
  @mani
  Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and OK
    Given path 'getPosts'
    When method GET
    Then status 200
 		And print response
 		And print karate.pretty(response)
 	#	And match response.name == "John Doe"
      
         