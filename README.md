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


Include the Module:

    include MovableInk
    
    
**Real-Time Content:**

    MovableInkClient.live_pics
    # => [#<LivePic collection_id=nil, ...>, ...]

    MovableInkClient.live_pic '123'
    # => #<LivePic id=123, ...>
    
    MovableInkClient.live_pic_stats '123'
    # => #<LivePicStats id=123, ...>

    lp = LivePic.new
    lp.name = "My Name"
    ...
    new_live_pic = MovableInkClient.create_live_pic lp
    # => #<LivePic id=123, ...>

    MovableInkClient.update_live_pic
    # => #<LivePic id=123, ...>

    lp = MovableInkClient.live_pics.first
    MovableInkClient.delete_live_pic lp
    # => true


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