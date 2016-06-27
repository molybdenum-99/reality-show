Reality Show
=========

Reality Show is a server for bots and a web console with Reality library included so you can quickly experiment with Reality.

## URL

http://reality-show.molybdenum.io


## Usage
Reality Show is generally a ruby console and an API for running any ruby code.
`Reality::Methods` is included so you can use shortcuts, e.g.

```ruby
Entity('Canada').area
E('Canada').area
```

Demo configuration keys for non-wiki services are also included.  
 
```ruby
E('London').coord.weather
``` 

More information about Reality commands is on Reality page https://github.com/molybdenum-99/reality

## Bots
Reality Show supports next platforms:

#### Hipchat
![](https://www.dropbox.com/s/p9ji4w7o4fde3jr/Screenshot%202016-06-27%2017.32.59.png?dl=0)
Add integration using "Build your own" wizard.

POST URL: http://reality-show.molybdenum.io/search?auth_token=room_token

#### Motion AI
POST URL: http://reality-show.molybdenum.io/search?sync=1

## Internals:

React.js + Sinatra + Puma
