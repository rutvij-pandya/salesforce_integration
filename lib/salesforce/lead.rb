module Salesforce
  class Lead < Base

    attr :fields_map

    SF_OBJ_NAME = "Lead"

    def initialize
      super()
      @fields_map = YAML.load_file(Rails.root.join("config", "salesforce", "lead.yml"))
    end

    class << self
      def streaming_topic_query
        "select Id, Status from Lead"
      end
    end
  end
end