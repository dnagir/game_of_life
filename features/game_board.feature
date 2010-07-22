
Feature: Game board is an open world
  In order to play the game
  I want to have a game board


  Scenario Outline: Moving on the board in one direction
    Given there is a board 3x3
    And starting at position <start>
    When move <direction> <steps> times
    Then current position should be <end>    
    Examples:
      | start | direction  | steps | end |
      |  1x1  |    east    |  3    | 1x1 |
      |  3x1  |    west    |  3    | 3x1 |
      |  2x1  |    south   |  3    | 2x1 |
      |  2x3  |    north   |  3    | 2x3 |
      |  1x1  | south-east |  3    | 1x1 |
      |  3x3  | north-west |  3    | 3x3 |
      |  1x3  | north-east |  3    | 1x3 |
      |  3x1  | south-west |  3    | 3x1 |      
      |  2x2  |   north    |  1    | 2x1 |
      |  2x2  |   south    |  1    | 2x3 |
      |  2x2  |   east     |  1    | 3x2 |
      |  2x2  |   west     |  1    | 1x2 |
      |  2x2  |   south    |  1    | 2x3 |
      |  2x2  | north-west |  1    | 1x1 |
      |  2x2  | north-east |  1    | 3x1 |
      |  2x2  | south-west |  1    | 1x3 |
      |  2x2  | south-east |  1    | 3x3 |

  
  Scenario: Game board initialisation creates living cells
    Given the game is initialised
    Then the board should have living cells
    


  Scenario Outline: Counting number of neighbours
    Given the board
      |x| | |
      |x|x| |
      | | | |
    Then cell at <position> should have <count> neighbours
    Examples:
      | position | count |
      |   1x1    |   2   |            
      |   1x2    |   2   |
      |   1x3    |   3   |
      |   2x1    |   3   |
      |   2x2    |   2   |
      |   2x3    |   3   |
      |   3x1    |   3   |
      |   3x2    |   3   |
      |   3x3    |   3   |
      
