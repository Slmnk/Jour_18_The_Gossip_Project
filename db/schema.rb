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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_02_185908) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.string "commenteable_type"
    t.integer "commenteable_id"
    t.index ["commenteable_type", "commenteable_id"], name: "index_comments_on_commenteable_type_and_commenteable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "gossip_tags", force: :cascade do |t|
    t.integer "gossip_id"
    t.integer "tag_id"
    t.index ["gossip_id"], name: "index_gossip_tags_on_gossip_id"
    t.index ["tag_id"], name: "index_gossip_tags_on_tag_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.string "likeable_type"
    t.integer "likeable_id"
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "pm_recipients", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "private_message_id"
    t.index ["private_message_id"], name: "index_pm_recipients_on_private_message_id"
    t.index ["recipient_id"], name: "index_pm_recipients_on_recipient_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.integer "sender_id"
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.integer "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end