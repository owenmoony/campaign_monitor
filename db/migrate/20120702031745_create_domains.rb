class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.integer :id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
