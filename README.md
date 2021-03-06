Reality Show
=========

Reality Show is a server for bots and a web console with Reality library included so you can quickly get information right from a chat and experiment with Reality.

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
![](https://www.dropbox.com/s/p9ji4w7o4fde3jr/Screenshot%202016-06-27%2017.32.59.png?raw=1)

Add it as an Integration using "Build your own" wizard. It takes 1 minute.

POST URL: http://reality-show.molybdenum.io//search?auth_token=room_token

(Put a room token to query string, keep 2 slashes in path)

#### Motion AI
POST URL: http://reality-show.molybdenum.io/search?sync=1

## Internals:

React.js + Sinatra + Puma + Resque
Console is pretty secure. When a Resque worker reserves a job it immediately forks a child process. The child processes the job and then exits.
