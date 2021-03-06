# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130314081511) do

  create_table "alternate_phrases", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  create_table "eng1_quran", :force => true do |t|
    t.integer "sura", :default => 0, :null => false
    t.integer "aya",  :default => 0, :null => false
    t.text    "text",                :null => false
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "url"
    t.integer  "position"
  end

  create_table "keywords", :force => true do |t|
    t.text     "words"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "languages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang"
    t.string   "name"
  end

  create_table "questions", :force => true do |t|
    t.string   "quest"
    t.string   "tags"
    t.integer  "sub_topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verse_ids"
    t.text     "answer"
    t.string   "quest_slug"
    t.integer  "view_count",      :default => 0
    t.string   "last_updated_by"
    t.string   "created_by"
  end

  create_table "quran_text", :force => true do |t|
    t.integer "sura", :default => 0, :null => false
    t.integer "aya",  :default => 0, :null => false
    t.text    "text",                :null => false
  end

  create_table "references", :force => true do |t|
    t.integer  "question_id"
    t.string   "issue"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verse_ids"
    t.string   "verse_ids_to"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["user_id"], :name => "index_roles_on_user_id"

  create_table "static_contents", :force => true do |t|
    t.text     "about"
    t.text     "duas"
    t.text     "faqs"
    t.text     "credits"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_topics", :force => true do |t|
    t.string   "name"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "name_slug"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "featured"
    t.integer  "position",           :default => 0
    t.string   "last_updated_by"
    t.string   "created_by"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "name_slug"
    t.string   "meaning"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position",           :default => 0
    t.string   "last_updated_by"
    t.string   "created_by"
  end

  create_table "trans_hilali", :primary_key => "Id", :force => true do |t|
    t.integer "sura", :default => 0, :null => false
    t.integer "aya",  :default => 0, :null => false
    t.text    "text",                :null => false
  end

  create_table "trans_sahih", :primary_key => "index", :force => true do |t|
    t.integer "sura", :default => 0, :null => false
    t.integer "aya",  :default => 0, :null => false
    t.text    "text",                :null => false
  end

  create_table "trans_urdu", :force => true do |t|
    t.integer "sura", :default => 0, :null => false
    t.integer "aya",  :default => 0, :null => false
    t.text    "text",                :null => false
  end

  create_table "translations", :force => true do |t|
    t.string   "name"
    t.string   "table_nam"
    t.boolean  "default",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",   :default => "English"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "verses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
