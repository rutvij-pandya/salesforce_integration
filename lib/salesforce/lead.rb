module Salesforce
  class Lead < Base

    attr :fields_map
    attr :sf_obj_name

    def initialize
      super()
      @fields_map = YAML.load_file(Rails.root.join("config", "salesforce", "lead.yml"))
      @sf_obj_name = "Lead"
    end

  end
end