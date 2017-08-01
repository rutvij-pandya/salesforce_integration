namespace :salesforce do

  desc "Create a push topic to subscribe to Account & Contact changes in Salesforce"
  task :create_account_and_contact_push_topic => :environment do|t|
    sf_obj = Salesforce::PushTopic.new
    params_detail.each do |params_hash|
      params_hash.merge!(Salesforce::PushTopic::STATIC_FIELDS)
      sf_obj.create(Salesforce::PushTopic::SF_OBJ_NAME, sf_obj.fields_map, params_hash)
    end
  end

  def params_detail
    [
      {
        name: 'AllAccounts',
        description: 'All account records',
        notify_for_fields: 'All',
        query: Salesforce::Account.streaming_topic_query},
      {
        name: 'AllContacts',
        description: 'All contact records',
        notify_for_fields: 'All',
        query: Salesforce::Contact.streaming_topic_query}
    ]
  end

end
