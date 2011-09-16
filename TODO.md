TODO
===============

**General:**

  - See note in movableink-api.rb regarding Crack
  - Sanity-check arguments to API calls.
    Currently params are passed blindly through where only integers are valid, for example.
  - I currently like that all API methods hang together off the API class, as you don't have to
    think too hard about which methods are part of which API component (real-time, creative, etc.)
    But could be convinced otherwise
    
**Real-Time:**

  - Support for POST http://movableink.com/api/v1/live_pics
  - Support for PUT http://movableink.com/api/v1/live_pics/[live_pic_id]
  - Support for DELETE http://movableink.com/api/v1/live_pics/[live_pic_id]
  

**Creative Optimizers:**

  - Support for all calls


**Live Tweets:**

  - Support for all calls

**Note:**

  - [API documentation](https://movableink.com/api/docs)
