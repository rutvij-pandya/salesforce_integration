namespace :streaming do

  desc "Fetch updates of Leads data from salesforce push stream and update in database"
  task :leads => :environment do |t|
    Salesforce::StreamingHandler.new("AllLeads").subscribe
  end
end