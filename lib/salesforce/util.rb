module Salesforce::Util

  LOAD_FILEDS_MAPPING = Proc.new { |file_name| YAML.load_file(Rails.root.join("config", "salesforce", "#{file_name.downcase}.yml")) }

  PARSER =  Proc.new do |fields_map, entity_hash|
              entity_hash = entity_hash.with_indifferent_access
              fields_map.inject({}) {|result, (key_field, val_field)| (entity_hash[key_field].present? ? result[val_field.to_sym]= entity_hash[key_field] : nil) ; result}
            end


  def self.included(base)
    base.extend(ClassMethods)
  end

  ## Instance methods
  
  def load_fields_map(file_name)
    LOAD_FILEDS_MAPPING.call(file_name)
  end

  def load_reverse_fields_map(file_name)
    LOAD_FILEDS_MAPPING.call(file_name).invert
  end

  def parse_fields_map(fields_map, entity_hash)
    PARSER.call(fields_map, entity_hash)
  end

  ## Class methods
  
  module ClassMethods
    def load_fields_map(file_name)
      LOAD_FILEDS_MAPPING.call(file_name)
    end

    def load_reverse_fields_map(file_name)
      LOAD_FILEDS_MAPPING.call(file_name).invert
    end

    def parse_fields_map(fields_map, entity_hash)
      PARSER.call(fields_map, entity_hash)
    end
  end

end