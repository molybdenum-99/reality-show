Reality Show
=========

Reality Show is a server and a web console with Reality library included so you can quickly experiment with Reality.

## URL

http://reality-show.molybdenum.io


## Usage
Reality::Methods is included so you can use shortcuts, e.g.

```ruby
Entity('Canada').area
```
More information is on Reality page https://github.com/molybdenum-99/reality

## Bots
Reality Show supports next platforms:

#### Hipchat
Add integration using "Build your own" wizard.

POST URL: http://reality-show.molybdenum.io/search?auth_token=room_token

#### Motion AI
POST URL: http://reality-show.molybdenum.io/search?sync=1

## Internals:

React.js + Sinatra + Puma
