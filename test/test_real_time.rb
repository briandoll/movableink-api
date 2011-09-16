require 'rubygems'
require 'helper'

class TestRealTime < Test::Unit::TestCase

  def test_unathorized_access
    MovableInk::API.token = nil
    assert_raise ArgumentError do
      response = MovableInk::API.live_pics
    end
  end
  
  def test_live_pics
    MovableInk::API.token = ::API_KEY
    response = MovableInk::API.live_pics
    assert response.kind_of?(LivePics)
    live_pics = response.live_pics
    assert !live_pics.nil?
    assert live_pics.kind_of?(Array)
    assert live_pics.first.kind_of?(LivePic)
    assert !live_pics.first.url.nil?
  end
  
  def test_live_pic
    MovableInk::API.token = ::API_KEY
    response = MovableInk::API.live_pic ::LIVE_PIC_ID
    assert !response.nil?
    assert response.kind_of?(LivePic)
    assert !response.url.nil?
  end
  
  def test_live_pic_stats
    MovableInk::API.token = ::API_KEY
    response = MovableInk::API.live_pic_stats ::LIVE_PIC_ID
    assert !response.nil?
    assert response.kind_of?(LivePicStats)
    assert !response.impressions.nil?
  end

end