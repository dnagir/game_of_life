Feature: Evolve
  In order to play the game  
  I want to evolve
  So that a new generation comes

  Scenario: Evolving to the next generation
    Given the board
      | |x| |
      |x| | |
      | |x| |
    When the board is evolved
    Then the board should be
      | |x| |
      |x|x| |
      | |x| |
