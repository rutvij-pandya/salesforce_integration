module Salesforce
  class Account < Base

    attr :fields_map

    SF_OBJ_NAME = "Account"

    def initialize
      super()
      @fields_map = load_fields_map(SF_OBJ_NAME)
    end

    class << self
      def streaming_topic_query
        "select Id, Phone, Industry from Account"
      end
    end
  end
end