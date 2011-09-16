require 'ostruct'

# Class representing a single LivePic with member access to all properties
#
class LivePic < OpenStruct; end

# Class containing an array of LivePic elements
#
class LivePics

  attr_accessor :live_pics

  def initialize(response)
    lp = []
    response["live_pics"].each do |live_pic|
      lp << LivePic.new(live_pic)
    end
    self.live_pics = lp
  end

end

# Class representing the stats for a LivePic instance
#
class LivePicStats < OpenStruct; end