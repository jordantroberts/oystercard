

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


 ```
 In order to keep using public transport
 As a customer
 I want to add money to my card
 ```


 ```
 In order to protect my money
 As a customer
 I don't want to put too much money on my card
 ```


 ```
 In order to pay for my journey
 As a customer
 I need my fare deducted from my card
 ```


 ```
 In order to get through the barriers
 As a customer
 I need to touch in and out
 ```


 ```
 In order to pay for my journey
 As a customer
 I need to have the minimum amount for a single journey
 ```

 ```
 In order to pay for my journey
 As a customer
 I need to pay for my journey when it's complete
```

```
 In order to pay for my journey
 As a customer
 I need to know where I've travelled from
```

```
 In order to know where I have been
 As a customer
 I want to see to all my previous trips
```

```
 In order to know how far I have travelled
 As a customer
 I want to know what zone a station is in
```

```
 In order to be charged correctly
 As a customer
 I need a penalty charge deducted if I fail to touch in or out
```
```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
 ```

 What I learned from this challenge
 -----
 *

 Acknowledgements
 -----

 Makers Academy Challenge
