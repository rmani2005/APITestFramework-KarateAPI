#Author: your.rmani2005@gmail.com

Feature: Table in KarateAPI

@regression
Scenario: Table in KarateAPI

* table cats
  | name   | age |
  | 'Bob'  | 2   |
  | 'Wild' | 4   |
  | 'Nyan' | 3   |
  
  * match cats == [{name: 'Bob', age: 2}, {name: 'Wild', age: 4}, {name: 'Nyan', age: 3}]
  
 
@regression
Scenario: Scenario2 - Table in KarateAPI 
* def one = 'hello'
* def two = { baz: 'world' }
* table json
  | foo     | bar            |
  | one     | { baz: 1 }     |
  | two.baz | ['baz', 'ban'] |
* match json == [{ foo: 'hello', bar: { baz: 1 } }, { foo: 'world', bar: ['baz', 'ban'] }]
* print karate.pretty(json)

@regression
Scenario: Scenario3 - With Null 
* def one = { baz: null }
* table json
  | foo     | bar    |
  | 'hello' |        |
  | one.baz | (null) |
  | 'world' | null   |
* match json == [{ foo: 'hello' }, { bar: null }, { foo: 'world' }]
* print karate.pretty(json)
