module Salesforce
  class Contact < Base

    attr :fields_map
    attr :sf_obj_name

    def initialize
      super()
      @fields_map = YAML.load_file(Rails.root.join("config", "salesforce", "contact.yml"))
      @sf_obj_name = "Contact"
    end

    def find_by_email(user_email)
      @client.query("select #{contact_query_fields} from Contact where Contact.Email='#{user_email}'").first
    end

    private

    def contact_query_fields
      "Contact.Id, Contact.FirstName, Contact.LastName, Contact.Email, Contact.Phone, Contact.AccountId"
    end

  end
end