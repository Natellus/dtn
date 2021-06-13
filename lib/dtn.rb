# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

require "dry-configurable"
require "forwardable"
require "concurrent-ruby"
require "active_support/inflector"
require "active_support/core_ext/string"
require "socket"
require "securerandom"
require "timeout"
require "date"

# Top level API methods only
module Dtn
  class Error < StandardError; end

  extend Dry::Configurable

  setting :host, ENV.fetch("DTN_HOST", "localhost")
end
