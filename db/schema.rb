# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120702032247) do

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "email_campaigns", :force => true do |t|
    t.integer  "remote_id"
    t.string   "subject"
    t.datetime "issued_at"
    t.integer  "emails_count"
    t.datetime "discovered_date"
    t.integer  "domain_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "samples", :force => true do |t|
    t.integer  "draft"
    t.integer  "finished"
    t.integer  "dispatched"
    t.integer  "delivered"
    t.integer  "dropped"
    t.integer  "bounce"
    t.integer  "deferred"
    t.integer  "failed"
    t.integer  "email_campaign_id"
    t.datetime "created_at",        :null => false
    t.boolean  "latest"
    t.datetime "updated_at",        :null => false
  end

end
