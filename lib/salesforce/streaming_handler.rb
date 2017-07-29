require 'faye'
# require "#{Rails.root}/lib/salesforce/streaming"

module Salesforce
  class StreamingHandler < Base

    attr :stream_topic_name

    def initialize(stream_topic_name)
      super()
      @stream_topic_name = stream_topic_name
    end

    def subscribe
      begin
        subscribe_push_topic
      rescue Restforce::AuthenticationError => e
        puts e
      end
    end

    private

    def subscribe_push_topic
      EM.run do
        # @client.subscribe @stream_topic_name, replay: -1 do |message|
        @client.subscribe @stream_topic_name do |message|
          begin
            p "------- stream response ------- "
            p message.inspect
          rescue Exception => e
            puts e
          end
        end
      end
    end
  end
end