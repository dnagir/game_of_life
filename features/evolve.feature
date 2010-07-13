Feature: Evolve
  In order to play the game  
  I want to evolve
  So that a new generation comes

  Scenario: Evolving to the next generation
    Given the board
      |x| | |
      |x|x| |
      | | | |
    And the game is initialised
    When the generation passes
    Then the board should be
      |x|x|x|
      |x|x|x|
      |x|x|x|
