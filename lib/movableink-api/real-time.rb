module RealTime
  
  # Public: Get a list of the live pics
  #
  # offset  - The number of items to skip
  # limit   - The maximum number of items to return. Capped at 100.
  #
  # Examples
  #
  #   MovableInk::API.live_pics
  #   # => [#<LivePic collection_id=nil, ...>, ...]
  #
  # Returns an array of LivePic instances
  # Returns ArgumentError if MovableInk::API.token is empty
  def live_pics(offset = nil, limit = nil)
    pics = LivePics.new(get("live_pics", {:offset => offset, :limit => limit}))
    pics.live_pics
  end


  # Public: Get a single live pic by ID
  #
  # live_pic_id  - The ID of the live pic to get
  #
  # Examples
  #
  #   MovableInk::API.live_pic '123'
  #   # => #<LivePic id=123, ...>
  #
  # Returns a LivePic instance
  # Returns ArgumentError if MovableInk::API.token is empty
  def live_pic(live_pic_id)
    response = get("live_pics/#{live_pic_id}")
    LivePic.new response["live_pic"]
  end

  # Public: Get stats for a single live pic by ID
  #
  # live_pic_id  - The ID of the live pic to get stats for
  #
  # Examples
  #
  #   MovableInk::API.live_pic_stats '123'
  #   # => #<LivePicStats id=123, ...>
  #
  # Returns a LivePicStats instance
  # Returns ArgumentError if MovableInk::API.token is empty
  def live_pic_stats(live_pic_id)
    response = get("live_pics/#{live_pic_id}/stats")
    LivePicStats.new response["live_pic"]["stats"]
  end
  
  # Public: Create a live pic using specified parameters
  #
  # live_pic  - A LivePic instance with properties set according to our needs
  #
  # Examples
  #
  #   lp = LivePic.new(:name => "my name", ...)
  #   MovableInk::API.create_live_pic lp
  #   # => #<LivePic name='my name', id='123' ...>
  #
  # Returns a LivePic instance that represents the newly created live pic
  # Returns ArgumentError if MovableInk::API.token is empty
  def create_live_pic(live_pic)
    params = live_pic.to_params
    response = post("live_pics", params)
    LivePic.new response["live_pic"]
  end
  
  # Public: Update a live pic using specified parameters
  #
  # live_pic  - A LivePic instance with properties set according to our needs
  #
  # Examples
  #
  #   lp = MovableInk::API.live_pics[0]
  #   lp.name = "Updated Name"
  #   MovableInk::API.update_live_pic(lp)
  #   # => #<LivePic name='Updated Name', id='123' ...>
  #
  # Returns a LivePic instance that represents the newly udpated live pic
  # Returns ArgumentError if MovableInk::API.token is empty
  def update_live_pic(live_pic)
    params = live_pic.to_params
    response = put("live_pics/#{live_pic.id}", params)
    LivePic.new response["live_pic"]
  end
  
end