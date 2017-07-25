class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.references :user, null: false, defailt: 0, index: true
      t.string :salesforce_id, index: true
      t.integer :status, limit: 1

      t.timestamps null: false
    end

  end
end
