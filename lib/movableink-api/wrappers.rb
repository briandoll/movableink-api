require 'ostruct'

# Class representing a single LivePic with member access to all properties
#
class LivePic

  def initialize(properties = {})
    instantiate_with_params(properties) if properties
  end

  # Name of the live pic. Example: live_pic[name]=my%20live%20pic
  attr_accessor :name

  # URL to use when taking a screenshot. URL-encoded.
  attr_accessor :external_url
  
  # Default URL to link to from embed code. URL-encoded.
  attr_accessor :target_url

  # Desired width of the cropped live pic image
  attr_accessor :width
  
  # Height of the cropped live pic image
  attr_accessor :height

  # Offset of the crop from the left side of the screenshot
  attr_accessor :x_offset

  # Offset of the crop from the top of the screenshot
  attr_accessor :y_offset

  # URL of png or jpg image to use. Enabled by live_pic[use_static_image].
  attr_accessor :static_image_url

  # Disables web capturing and instead displays a static image. 
  # Requires live_pic[static_image_url] to be set
  attr_accessor :use_static_image
  
  # Timestamp when the live picture was last updated
  attr_accessor :updated_at
  
  # Movable Ink URL to preview this live pic
  attr_accessor :preview_url
  
  # The full "live" URL of this live pic
  attr_accessor :url
  
  # No idea ;)
  attr_accessor :screen_width
  
  # source URL where this live pic originated
  attr_accessor :external_url
  
  # ID of the collection this live pic belongs to; nil if it doens't belong to one
  attr_accessor :collection_id
  
  # Link URL if this live pic has one
  attr_accessor :target_url

  # unique ID of this live pic
  attr_accessor :id
  
  # Timestamp when this live pic was created
  attr_accessor :created_at

  # TODO document these methods
  attr_accessor :use_image_map
  attr_accessor :format
  attr_accessor :capture_interval
  attr_accessor :template_id
  attr_accessor :campaign_id
  attr_accessor :backup_image_content_type
  attr_accessor :streaming
  attr_accessor :disabled_at
  attr_accessor :backup_image_updated_at
  attr_accessor :force_capture
  attr_accessor :backup_image_url
  attr_accessor :alt_text
  attr_accessor :backup_image_file_name
  attr_accessor :pass_location
  attr_accessor :company_id
  attr_accessor :backup_image_file_size
  attr_accessor :watermark
  attr_accessor :html_id
  attr_accessor :use_overlay_logo
  attr_accessor :key
  attr_accessor :pass_device_type
  attr_accessor :page_hash

  # Properties of LivePic that may be populated when creating a LivePic via API
  CREATION_PARAMS = [
      'name', 'external_url', 'target_url', 'width', 'height',
      'x_offset', 'y_offset', 'static_image_url', 'use_static_image'
    ]

  # Return creation params as a hash formatted specifically for the API
  #
  # Special formatting and attribute list for create_live_pic & update_live_pic
  #
  # Example:
  #   to_params
  #   # => {'live_pic[somename]' => "my%20awesome%20name", ... }
  #
  # Returns a hash with the name and values of this instance formatted for the API
  def to_params
    params = {}
    CREATION_PARAMS.each do |name|
      value = self.send(name)
      params["live_pic[#{name}]"] = value if value
    end
    params
  end

  def instantiate_with_params(params)
    params.each do |k,v|
      self.send("#{k}=", v)
    end
  end
  
end

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