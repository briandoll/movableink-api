movableink-api
====================

[Movable Ink](http://movableink.com/) provides "Real-time Content for Email".  This ruby gem provides a convenient wrapper to access the [Movable Ink API](http://movableink.com/features/api).

Installation
------------------

    gem install movableink-api


Usage
--------------------

Put movableink-api in your Gemfile:

    gem 'movableink-api'

**Real-Time Content:**

    MovableInk::API.live_pics
    # => [#<LivePic collection_id=nil, ...>, ...]

    MovableInk::API.live_pic '123'
    # => #<LivePic id=123, ...>
    
    MovableInk::API.live_pic_stats '123'
    # => #<LivePicStats id=123, ...>


**Creative Optimizers**

  Not implemented yet


**Live Tweets**

  Not implemented yet


Notes
--------------------

See History.md for a list of changes and contributors

See TODO.md for a list of pending features and known issues

_In order to run the tests, add your API token to tests/helper.rb_

Author
--------------------

Brian Doll, [@briandoll](https://twitter.com/briandoll), [emphaticsolutions.com](http://emphaticsolutions.com)