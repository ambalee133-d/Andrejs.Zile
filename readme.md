## Match! Task - Andrejs Zile Submission
All code is in MatchTask class. The cards are identified using integers.

Each card is represented using 3 digits. 
1st digit is type of card, and the other two is card type. 
In this implementation we don't necessarily need to know what the exact card is.

```
52 cards - 4 stacks of 13 cards [1 to 13]
1 - clubs
2 - diamonds
3 - hearts
4 - spades
```

An example of Ace of Spades would be `413` or Jack of Diamonds `211` or Two of Clubs `101`.

The application supports following input parameters:
```
(1) how many packs of cards to use (N)
(2) which of the three matching conditions to use 
     - [1] face value of card
     - [2] the suit
     - [3] both
```


The app does process the following steps:
```
(1) Creates two players
(2) Assigns and shuffles each pack of cards
(3) Each player takes top card from stack, the number of cards in stack is counted.
(4) Once a player pulls matching card, the stack which has been used, is counted to the player who pulled the matching card.
(5) The app runs until there are no reamining cards.
```

App structure:
```
match_task.rb - is the main class, creation of a new instance of this task will start the game
player.rb - is the Player class, which stores the number of cards player has collected during the game
card_stack.rb - generates the stack of cards, shuffles the cards and returns top card
```



