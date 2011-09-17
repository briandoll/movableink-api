require 'rubygems'
require 'helper'

class TestRealTime < Test::Unit::TestCase

  include MovableInk

  def test_unathorized_access
    MovableInkClient.token = nil
    assert_raise ArgumentError do
      response = MovableInkClient.live_pics
    end
  end
  
  def test_live_pics
    MovableInkClient.token = ::API_KEY
    live_pics = MovableInkClient.live_pics
    assert !live_pics.nil?
    assert live_pics.kind_of?(Array)
    assert live_pics.first.kind_of?(LivePic)
    assert !live_pics.first.url.nil?
  end
  
  def test_live_pic
    MovableInkClient.token = ::API_KEY
    response = MovableInkClient.live_pic ::LIVE_PIC_ID
    assert !response.nil?
    assert response.kind_of?(LivePic)
    assert !response.url.nil?
  end
  
  def test_live_pic_stats
    MovableInkClient.token = ::API_KEY
    response = MovableInkClient.live_pic_stats ::LIVE_PIC_ID
    assert !response.nil?
    assert response.kind_of?(LivePicStats)
    assert !response.impressions.nil?
  end

  def test_live_pic_wrapper
    lp = LivePic.new
    lp.name   = "My Name"
    lp.height = "10"
    params = lp.to_params
    assert params["live_pic[name]"], "My Name"
    assert params["live_pic[height]"], "10"
  end

  def test_create_live_pic
    MovableInkClient.token = ::API_KEY
    lp = LivePic.new
    lp.name   = "My Name"
    lp.height = "10"
    lp.width  = "10"
    lp.external_url = "http://google.com/"
    lp.x_offset = "20"
    lp.y_offset = "20"
    lp.target_url = 'http://google.com/'
    new_live_pic = MovableInkClient.create_live_pic lp

    assert new_live_pic.kind_of?(LivePic)
    assert new_live_pic.name, "My Name"
    assert new_live_pic.height, "10"
  end

  def test_update_live_pic
    MovableInkClient.token = ::API_KEY
    lp = MovableInkClient.live_pics.first
    updated_pic_id = lp.id
    name = "Updated Name - #{Time.now.to_i}"
    lp.name = name
    MovableInkClient.update_live_pic lp
    updated_pic = MovableInkClient.live_pic updated_pic_id
    assert updated_pic.name, name
  end

  def test_delete_live_pic
    MovableInkClient.token = ::API_KEY
    lp = MovableInkClient.live_pics.first
    deleted = MovableInkClient.delete_live_pic lp
    assert deleted
  end

end