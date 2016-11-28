# Crazy Eights

**Do not share this repo or post it publicly. We will take violations
very seriously.**

## Rules

* You have **1 hour** for the assessment. Do not worry if you do not
  complete all the assessment; finish as much as you can.
* Descriptions of each method to implement are written into the `lib/`
  files. For each `lib/` file, there is a corresponding `spec/` file.
* Run the specs as you solve the assessment. Solve the assessment in
  this order:

```
bundle exec rspec spec/deck_spec.rb
bundle exec rspec spec/pile_spec.rb
bundle exec rspec spec/ai_player_spec.rb
```

* Wait until you finish to run `bundle exec rspec spec`, which will
  run all the tests. Do this as a final check that you have them all
  passing.
* To run one specific spec, add `:line_number` at the end.  For example,
  `bundle exec rspec spec/deck_spec.rb:30`.
* If a failing spec confuses you, look at the spec file to see if you
  can discern what it is asking of you. There are sometimes comments
  in the spec files to help you.
* Please ask your TAs any questions. If you get stuck or don't know
  why something is failing; ask. TAs will let you know whether they
  can answer your question, so ask anything.
    * Do not use the internet or prior notes, please.
* To submit:
    * Rename the directory `first_name_last_name`.
    * ZIP it (you can use OS X's built in zip functionality)
    * Use `.zip`; no boutique formats please :-)
    * Upload to progress tracker (http://progress.appacademy.io/).

## Hint

* **USE THE SPECIFIED API**. We have carefully guided you on the
  methods you'll need in `Deck` and `Pile` to let you easily write
  `AIPlayer`. Use these methods; you'll see that we use `stub` and
  `should_receive` in `ai_player_spec.rb` to setup objects for the
  test. You will need to call the methods defined in `Deck` and `Pile`
  that you wrote previously.

## Game Rules

* Players are initially dealt eight cards.
* The goal is to discard all your cards first.
* The discard pile contains one initial card.
* Play goes around in turns.
* Player may play either the same number as the top card in the
  discard pile, or the same suit.
* The player may also always play an eight of any suit, in which case
  they also get to specify a new suit to play next round.

Further game rules are described on [Wikipedia][crazy-eight-rules],
but the above is the limit of what you need to implement.

[crazy-eight-rules]: http://en.wikipedia.org/wiki/Crazy_eights

**Copyright App Academy, please do not post online**
