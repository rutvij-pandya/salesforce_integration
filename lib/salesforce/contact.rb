module Salesforce
  class Contact < Base

    attr :fields_map

    SF_OBJ_NAME = "Contact"

    def initialize
      super()
      @fields_map = load_fields_map(SF_OBJ_NAME)
    end

    def find_by_email(user_email)
      @client.query("select #{contact_query_fields} from Contact where Contact.Email='#{user_email}'").first
    end

    class << self
      def streaming_topic_query
        "select Id, Email, Phone, FirstName, LastName from Contact"
      end
    end

    private

    def contact_query_fields
      "Contact.Id, Contact.FirstName, Contact.LastName, Contact.Email, Contact.Phone, Contact.AccountId"
    end

  end
end