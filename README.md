# Prisoner's Dilemma

This is a Ruby implementation of the classic game "Prisoner's Dilemma". It simulates multiple rounds of the game between two players using different strategies and keeps track of their scores.

## Game Rules

In the Prisoner's Dilemma game, two players are given the choice to either "Stay Silent" or "Testify". The possible outcomes and corresponding scores are as follows:

- If both players "Stay Silent", they each receive a moderate sentence, resulting in a score of 1 for each.
- If one player "Stays Silent" and the other "Testifies", the player who testified gets a reduced sentence (score of 0) while the other player receives a harsh sentence (score of 3).
- If both players "Testify", they both receive a slightly reduced sentence, resulting in a score of 2 for each.

## Usage

1. Install Ruby on your machine if you haven't already.
2. Clone this repository to your local machine.
3. Open a terminal and navigate to the project directory.
4. Run the following command to start the game:

   ```shell
   ruby ./lib/run_game.rb
   ```

5. Follow the prompts to enter the player names and select their strategies.
6. Specify the number of rounds you want to play.
7. The game will simulate the specified number of rounds and display the final scoreboard.

## Strategies

The game supports the following strategies for the players:

- **Random**: The player makes a random decision each round.
- **Stay Silent**: The player always chooses to "Stay Silent" in each round.
- **Testify**: The player always chooses to "Testify" in each round.
- TBD

Feel free to modify or add new strategies by implementing them in the `Strategies` module.

## Dependencies

The project has the following dependencies:

- Ruby (version 3.2.0)
- RSpec (for running tests)


## Running Rubocop linters

1. Make sure you have installed the RSpec gem (`gem install rubocop`, `gem install rubocop-performance`) if you haven't already.
2. Open a terminal and navigate to the project directory.
3. Run the following command to execute the tests:

   ```shell
   rubocop
   ```
   or
    ```shell
   rubocop -A 
   ```
    
   The rubocop results will be displayed in the terminal.

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute this software.
