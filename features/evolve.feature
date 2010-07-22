Feature: Evolve
  In order to play the game  
  I want to evolve
  So that a new generation comes

  Scenario: Evolving to the next generation (avg setup)
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



  Scenario: Evolving to the next generation (ma, are we alone?)
    Given the board
      |x| | |
      | |x| |
      | | | |
    And the game is initialised
    When the generation passes
    Then the board should be
      | | | |
      | | | |
      | | | |


  Scenario: Evolving to the next generation (overpopulated)
    Given the board
      |x|x|x|
      |x|x|x|
      |x|x|x|
    And the game is initialised
    When the generation passes
    Then the board should be
      | | | |
      | | | |
      | | | |


      
  Scenario: Evolving to the next generation (desert)
    Given the board
      | | | |
      | | | |
      | | | |
    And the game is initialised
    When the generation passes
    Then the board should be
      | | | |
      | | | |
      | | | |
