class CreateEmailCampaigns < ActiveRecord::Migration
  def change
    create_table :email_campaigns do |t|
      t.integer :id
      t.integer :remote_id
      t.string :subject
      t.datetime :issued_at
      t.integer :emails_count
      t.datetime :discovered_date
      t.integer :domain_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
