
Feature: Game board is an open world
  In order to play the game
  I want to have a game board

  
  Scenario Outline: Moving on the board in one direction
    Given there is a board <size>
    And starting at position <start>
    When move <direction> <steps> times
    Then current position should be <end>    
    Examples:
      | size | start | direction  | steps | end |
      | 3x3  |  1x1  |    east    |  3    | 1x1 |
      | 3x3  |  3x1  |    west    |  3    | 3x1 |
      | 3x3  |  2x1  |    south   |  3    | 2x1 |
      | 3x3  |  2x3  |    north   |  3    | 2x3 |
      | 3x3  |  1x1  | south-east |  3    | 1x1 |
      | 3x3  |  3x3  | north-west |  3    | 3x3 |
      | 3x3  |  1x3  | north-east |  3    | 1x3 |
      | 3x3  |  3x1  | south-west |  3    | 3x1 |


  Scenario: Game board initialisation creates living cells
    Given there is a board 3x3
    When the game is initialised
    Then the board should have living cells
    

