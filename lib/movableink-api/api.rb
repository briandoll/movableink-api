module MovableInk
  
  class MovableInkError < StandardError; end
  
  class MovableInkClient

    # This library supports v1 of the MovableInk API
    NAMESPACE = "http://movableink.com/api/v1/"
    
    class << self

      # Set the MovableInk API token
      #
      # token - The string value of the API token
      #
      # Returns nothing.
      attr_writer :token
      
      # Public: Get the MovableInk API token
      #
      # Returns the String value of the API token
      attr_reader :token
      
    end
    
    extend RealTime
    extend CreativeOptimizers
    extend LiveTweets
    
    private

    # GET a specific MovableInk API call with parameters
    #
    # api_path - The API method to invoke
    # params   - A Hash containing any parameters to be sent with this request
    #
    # Examples
    #
    #   get('live_pics', {:offset => 40})
    #   # => {:live_pics => [{:collection_id => nil, ...}, ...]}
    #
    # Returns a Hash representation of the JSON response body
    def self.get(api_path, params = nil)
      url = build_url(api_path, params)
      response = Net::HTTP.get_response url
      process_response response
    end

    # POST a specific MovableInk API call with parameters
    #
    # api_path - The API method to invoke
    # params   - A Hash containing any parameters to be sent with this request
    #
    # Examples
    #
    #   post('live_pics', {:name => 'some name', ...})
    #   # => {:live_pic => {:name => 'some name', ...}}
    #
    # Returns a Hash representation of the JSON response body
    def self.post(api_path, params = nil)
      url = build_url(api_path)
      params["token"] = token # POST params overwrite params in URI
      response = Net::HTTP.post_form url, params
      process_response response
    end

    # PUT a specific MovableInk API call with parameters
    #
    # api_path - The API method to invoke
    # params   - A Hash containing any parameters to be sent with this request
    #
    # Examples
    #
    #   put('live_pics', {:name => 'some name', ...})
    #   # => {:live_pic => {:name => 'some name', ...}}
    #
    # Returns a Hash representation of the JSON response body
    def self.put(api_path, params = nil)
      url = build_url(api_path)
      request = Net::HTTP::Put.new(url.path)
      params["token"] = token # PUT params overwrite params in URI
      request.set_form_data params
      response = Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }
      process_response response
    end

    def self.delete(api_path)
      url = build_url(api_path)
      http = Net::HTTP.new(url.host)
      request = Net::HTTP::Delete.new("#{url.path}?#{url.query}")
      response = http.request(request)
      response.kind_of?(Net::HTTPOK)
    end


    # Build a URI object reprsenting an API URL based on the parameters provided
    #
    # api_path - The API method to invoke
    # params   - A Hash containing any parameters to be sent with this request
    #
    # Examples
    #
    #   build_url('live_pics')
    #   # => #<URI::HTTP:0x101afe1a8 URL:http://movableink.com/api/v1/live_pics?token=xxxxx>
    #
    # Returns a URI object representing the URL for an API call
    # Returns ArgumentError if the MovableInkClient.token is empty
    def self.build_url(api_path, params = nil)
      validate_request
      url = URI.parse(NAMESPACE + api_path)
      query = "token=#{token}"
      params.each{|k,v| query << "&#{k.to_s}=#{v.to_s}" if v} if params
      url.query = query
      url
    end
    
    # Validate that all required parameters are set for a given API call
    #
    # Currently only checks to see that the MovableInkClient.token is set
    #
    # Returns nothing.
    # Raises ArgumentError if the MovableInkClient.token is empty
    def self.validate_request
      raise ArgumentError.new "Please set your MovableInk API token before any calls to the API. ex. MovableInkClient.token(yourtoken)" if token.nil?
    end
    
    # Convert response body to JSON if the response is not an error
    #
    # Returns a JSON representation of the response body
    # Raises MovableInkError if there is an error in the response
    def self.process_response(response)
      resp = Crack::JSON.parse response.body
      err  = resp["errors"]
      raise MovableInkError.new "Error: #{resp["message"]} - #{err["base"]}" if err
      resp
    end
    
  end
end