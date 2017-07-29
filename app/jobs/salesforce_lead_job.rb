class SalesforceLeadJob < Struct.new(:user_id)

  def perform
    user = User.select("id, first_name, last_name, email, phone, company").where(id: user_id).first
    sf_obj = Salesforce::Lead.new

    if user.lead.present?
      # update data in Salesforce only if Lead is still Open
      # do not update data once lead gets converted/ cancelled
      if user.lead.status == "open"
        entity_hash = user.attributes.merge(salesforce_id: user.lead.salesforce_id)
        sf_obj.update(Salesforce::Lead::SF_OBJ_NAME, sf_obj.fields_map, entity_hash)
      end
    else
      user.build_lead(status: Lead.statuses["open"]).save!
      # Push data to Salesforce
      sf_lead_id = sf_obj.create(Salesforce::Lead::SF_OBJ_NAME, sf_obj.fields_map, user.attributes)
      # Update DB entry with Salesforce Lead ID
      Lead.where(user_id: user.id).update_all(salesforce_id: sf_lead_id)
    end
  end

  def max_attempts
    3
  end

  def failure
    ## TODO - Send failure notification mail
  end

end
