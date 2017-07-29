module Salesforce
  class PushTopic < Base

    attr :fields_map
    attr :sf_obj_name

    SF_OBJ_NAME = "PushTopic"
    STATIC_FIELDS = {api_version: SALESFORCE["api_version"]}

    def initialize
      super()
      @fields_map = YAML.load_file(Rails.root.join("config", "salesforce", "push_topic.yml"))
    end

  end
end