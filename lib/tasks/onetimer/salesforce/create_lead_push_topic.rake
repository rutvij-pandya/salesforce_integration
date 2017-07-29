namespace :salesforce do

  desc "Create a push topic to subscribe to Lead changes in Salesforce"
  task :create_lead_push_topic => :environment do|t|
    sf_obj = Salesforce::PushTopic.new
    sf_obj.create(Salesforce::PushTopic::SF_OBJ_NAME, sf_obj.fields_map, params_hash)
  end

  def params_hash
    {name: 'AllLeads',
     description: 'All lead records',
     notify_for_fields: 'All',
     query: Salesforce::Lead.streaming_topic_query}.merge!(Salesforce::PushTopic::STATIC_FIELDS)
    # notify_for_operations: 'All' - Value 'All' is set as Default in Salesforce.
  end

end
