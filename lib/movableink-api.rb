require 'net/http'
require 'crack'
require 'movableink-api/wrappers'
require 'movableink-api/real-time'
require 'movableink-api/creative-optimizers'
require 'movableink-api/live-tweets'
require 'movableink-api/api'

# Crack can throw this error, which it does not define.
# TODO: Patch Crack and send pull request
class Crack::JSON::ParseError < StandardError; end