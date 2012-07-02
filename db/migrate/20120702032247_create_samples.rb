class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.integer :id
      t.integer :draft
      t.integer :finished
      t.integer :dispatched
      t.integer :delivered
      t.integer :dropped
      t.integer :bounce
      t.integer :deferred
      t.integer :failed
      t.integer :email_campaign_id
      t.datetime :created_at
      t.boolean :latest

      t.timestamps
    end
  end
end
