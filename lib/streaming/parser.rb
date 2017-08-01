module Streaming
  class Parser
    include Salesforce::Util

    attr :stream_topic_name
    attr :stream_response

    def initialize(stream_topic_name, stream_response)
      @stream_topic_name = stream_topic_name
      @stream_response = stream_response
    end

    def parse_response
      send("#{@stream_topic_name.parameterize}_parser")
    end

    private

    def allleads_parser
      p "------- Lead - stream response ------- "
      fields_map = load_reverse_fields_map(Salesforce::Lead::SF_OBJ_NAME)
      entity_hash = parse_fields_map(fields_map, @stream_response)
      lead = Lead.where(salesforce_id: entity_hash[:salesforce_id]).first
      lead.update(status: Lead.formatted_status(entity_hash[:status]))
    end

    ## TODO - Handle Account subscription
    def allaccounts_parser
      p "------- Account - stream response ------- "
      p @stream_response.inspect
    end

    ## TODO - Handle Contact subscription
    def allcontacts_parser
      p "------- Contact - stream response ------- "
      p @stream_response.inspect
    end

    ## NOTE - PushTopic queries support the following standard objects.
    #
    # Lead
    # Account
    # Contact
    # Campaign
    # Case
    # Opportunity
    # Task
    #
    # PushTopic queries support all custom objects.

  end
end