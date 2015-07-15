# hubot-java-repl

Hubot reads, evaluates, prints and makes you loop java expressions

See [`src/java-repl.coffee`](src/java-repl.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-java-repl --save`

Then add **hubot-java-repl** to your `external-scripts.json`:

```json
[
  "hubot-java-repl"
]
```

## Sample Interaction

```
user1>> hubot java me 2+2
hubot>> java.lang.Integer res0 = 4
```
