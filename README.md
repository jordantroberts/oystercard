

 Oystercard Challenge
 =================

 This challenge was set as our second weekly pairing challenge at Makers Academy. It enabled me to really stretch my skills in Ruby, TDD and object-oriented design. The challenge is designed to help students achieve the following goals:

 1. I can write code that is easy to change - this is a skill that is highly prized amongst developers.

 2. I can test-drive my code - tested software is easier to change, as it is easier to tell when it is broken by running edge cases.

 3. I can build with objects.

 Steps to run this program
 -------

 1. Clone to your local machine
 2. Run the command `gem install bundle` (if you don't have bundle already)
 3. When the installation completes, run `bundle`

 Using this program
 -------

 This is an example of how you could use this program in irb. You will need to `require` the `oyster.rb` file first:
 ```
 irb
 > require './lib/oyster.rb
  => true
 > card = Oyster.new
  => #<Oyster:0x00007f95660a56d8 @balance=0, @journey_history=[]>
 > card.top_up(10)
  => 10
 > card.touch_in("Liverpool Street")
  => "Liverpool Street"
 > card.touch_out("Bank")
  => [{:entry=>"Liverpool Street", :exit=>"Bank"}]
 > card.touch_in("Bank")
  => "Bank"
 > card.touch_out("Mile End")
  => [{:entry=>"Liverpool Street", :exit=>"Bank"}, {:entry=>"Bank", :exit=>"Mile End"}]
 > card.journey_history
  => [{:entry=>"Liverpool Street", :exit=>"Bank"}, {:entry=>"Bank", :exit=>"Mile End"}]
 > card.balance
  => 8
 ```

 My Approach
 ---------

 At the beginning of the challenge, I was given the following tasks and user stories. I have explained my approach to problem solving under each individual user story below:

 ```
 In order to use public transport
 As a customer
 I want money on my card
 ```
 I wanted each new card to start with a fresh balance of £0. I made 'balance' an instance variable and initialized each new instance of the Oystercard class (i.e. each new card) with an empty balance, in order for the user to have the ability to add money to their card.

 ```
 In order to keep using public transport
 As a customer
 I want to add money to my card
 ```
 I added a top_up method, which enabled the user to add money to the balance of their card. I wanted the user to be able to decide how much they topped up by, so I chose to pass 'money' as an argument. This was then added to the balance and the balance updated with the new amount.

 ```
 In order to protect my money
 As a customer
 I don't want to put too much money on my card
 ```
 This would require a maximum balance. In order to make this changeable, I set 'MAX_BALANCE' as a constant and updated the top_up method to raise an error when the maximum balance of the card was exceeded.

 ```
 In order to pay for my journey
 As a customer
 I need my fare deducted from my card
 ```
 I approached this in a similar way to the top_up method, with money being passed as an argument in order to deduct that amount from the balance of the card. As the deduct method is tested implicitly whilst testing the touch_out method (see below), I was able to change the deduct method to private. This helps to keep functionality encapsulated and prevents excessive dependencies from being created in the future.

 ```
 In order to get through the barriers
 As a customer
 I need to touch in and out
 ```
 I added three methods - touch_in, touch_out and a predicate method in_journey? to track the status of the Oystercard.

 ```
 In order to pay for my journey
 As a customer
 I need to have the minimum amount for a single journey
 ```
 I needed to set a minimum amount and I did so by setting a constant (MIN_BALANCE) so that this could be easily changed later on. I needed to ensure that the user would not be able to travel unless they had the minimum amount on their card. In real life, this error would occur when they try to touch in at the station, so I updated my touch_in method to reflect this and raised an error if they did not have the MIN_BALANCE on their card.

 ```
 In order to pay for my journey
 As a customer
 I need to pay for my journey when it's complete
```
 I added a fare method to my 'Journey' class (which I created when my Oystercard class began to become responsible for too many things and I wanted to adhere to the Single Responsibility Principle). The fare could be passed to the deduct method as an argument and would deduct a fare of £1 for each journey once it was complete.

 This method also depended on whether the journey was complete or not, so I added a predicate journey_complete? method, which checked if the entry and exit stations had been recorded. If there was both a touch in station and a touch out station, the journey was marked as complete and a fare could be deducted.

```
 In order to know where I have been
 As a customer
 I want to see to all my previous trips
```
 This was tricky! In order to save several journeys I knew that I needed a data structure that would hold an ordered sequence of objects. This structure every time a journey is made. I wanted every new card to be initialized with an empty journey history that could be added to and therefore I updated the initialize method to include 'journey_history', set as an empty an array.

 In order to store the journey, I created an add_journey method, which stored the entry and exit stations in a hash (with entry/exit as the keys and the names of the stations as the values), which I then pushed to the journey history array. When the user wants to see their journey_history, they just need to call this method on the card object to see a full list.

```
 In order to be charged correctly
 As a customer
 I need a penalty charge deducted if I fail to touch in or out
```
 I knew I would need a set penalty charge so I added this as a constant to the Journey class. Setting it as a constant means that it can be updated later if the penalty changes. I then added a penalty method which updated the fare to equal the penalty fare, unless the journey was complete.


 What I learned from this challenge
 -----
 This challenge helped me to practice the following skills:

 * TDD and object-oriented design
 * Writing clean code that is easy to change and easy to read
 * Domain modelling to translate user stories into code 


 Acknowledgements
 -----

 Makers Academy Challenge
