module Salesforce
  class Lead < Base

    attr :fields_map

    SF_OBJ_NAME = "Lead"

    def initialize
      super()
      @fields_map = load_fields_map(SF_OBJ_NAME)
    end

    class << self
      def streaming_topic_query
        "select Id, Status from Lead"
        # FirstName, LastName, Email, Phone - SELECT these fields, if values of these fields are likely to change in
        # Salesforce for Open leads as per business requirement
      end
    end
  end
end