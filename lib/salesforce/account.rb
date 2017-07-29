module Salesforce
  class Account < Base

    attr :fields_map

    SF_OBJ_NAME = "Account"

    def initialize
      super()
      @fields_map = YAML.load_file(Rails.root.join("config", "salesforce", "account.yml"))
    end

  end
end