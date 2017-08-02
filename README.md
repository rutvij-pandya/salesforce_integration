# salesforce_integration
Salesforce REST API &amp; Streaming API Integration demo app

## gemfile
```ruby
gem 'restforce', '~> 2.5.3'
gem 'faye'
gem 'devise', '3.4.1'
gem 'bootstrap-sass'
gem 'delayed_job_active_record'
```

## Application functionalities

- Use Devise to set up user Registration and Profile update functionality
- Use Delayed-Job to perform Salesforce REST API call in background
- When a new user registers, send user’s details to Salesforce to generate a business Lead (Leads is a default object of Salesforce platform). 
- If user updates profile details and Lead in Salesforce is still Open or not Converted/Closed, send updated details to Salesforce to update relevant Lead. 
- Pull changes from Salesforce (i.e, Status change) into database using Salesforce Streaming API
