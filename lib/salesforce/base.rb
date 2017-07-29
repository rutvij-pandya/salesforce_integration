require 'restforce'

module Salesforce
  class Base

    def initialize
      @client = Restforce.new :username       => SALESFORCE["username"],
                              :password       => SALESFORCE["password"],
                              :security_token => SALESFORCE["security_token"],
                              :client_id      => SALESFORCE["client_id"],
                              :client_secret  => SALESFORCE["client_secret"],
                              :api_version    => SALESFORCE["api_version"]
      @client.authenticate!
    end

    def create(sf_object, fields_map, entity_hash)
      @client.create!(sf_object, sf_fields_map(fields_map, entity_hash))
    end

    def update(sf_object, fields_map, entity_hash)
      @client.update(sf_object, sf_fields_map(fields_map, entity_hash))
    end

    def upsert(sf_object, sf_uniq_identifier="Id", fields_map, entity_hash)
      @client.upsert(sf_object, sf_uniq_identifier, sf_fields_map(fields_map, entity_hash))
    end

    def find(sf_object, sf_id)
      @client.find(sf_object, sf_id)
    end

    private

    def sf_fields_map(fields_map, entity_hash)
      entity_hash = entity_hash.with_indifferent_access
      fields_map.inject({}) {|result, (db_field, sf_field)| (entity_hash[db_field].present? ? result[sf_field.to_sym]= entity_hash[db_field] : nil) ; result}
    end

  end
end