namespace :streaming do

  desc "Fetch updates of Leads data from salesforce push stream and update in database"
  task :leads => :environment do |t|
    Streaming::Subscriber.new("AllLeads").subscribe
  end

  desc "Fetch updates of Accounts data from salesforce push stream and update in database"
  task :accounts => :environment do |t|
    Streaming::Subscriber.new("AllAccounts").subscribe
  end

  desc "Fetch updates of Contacts data from salesforce push stream and update in database"
  task :contacts => :environment do |t|
    Streaming::Subscriber.new("AllContacts").subscribe
  end
end