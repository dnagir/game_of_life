Feature: Cell survival
  In order to play the game  
  I want to see some cells surviving to the next generation
  And others dieing
  And some resurrecting
  
  
  Scenario Outline: Surviving with neighbours
    Given there is a live cell
    And there are <neighbours> neighbours
    When the cell is evolved
    Then the cell should be <status>
    Examples:
      | neighbours | status |
      |      0     | dead   |
      |      1     | dead   |
      |      2     | live   |
      |      3     | live   |
      |      4     | dead   |
      |      5     | dead   |
      |      6     | dead   |
      |      7     | dead   |
      |      8     | dead   |


  Scenario Outline: A dead cell with exactly 3 live neighbours becomes a live cell
    Given there is a dead cell
    And there are <neighbours> neighbours
    When the cell is evolved
    Then the cell should be <status>    
    Examples:
      | neighbours | status |
      |      0     | dead   |
      |      1     | dead   |
      |      2     | dead   |
      |      3     | live   |
      |      4     | dead   |
      |      5     | dead   |
      |      6     | dead   |
      |      7     | dead   |
      |      8     | dead   |
      

