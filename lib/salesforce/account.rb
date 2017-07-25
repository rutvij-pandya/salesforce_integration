module Salesforce
  class Account < Base

    attr :fields_map
    attr :sf_obj_name

    def initialize
      super()
      @fields_map = YAML.load_file(Rails.root.join("config", "salesforce", "account.yml"))
      @sf_obj_name = "Account"
    end

  end
end