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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150402152343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amas", force: :cascade do |t|
    t.string   "user_id",           limit: 255
    t.string   "desc",              limit: 255
    t.datetime "start_time"
    t.integer  "answer_count",                  default: 0
    t.integer  "like_count",                    default: 0
    t.integer  "question_count",                default: 0
    t.string   "category",          limit: 255, default: "all"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mentor_url",        limit: 255
    t.string   "mentor_code",       limit: 255
    t.string   "one_liner",         limit: 255
    t.text     "description"
    t.string   "background",        limit: 255
    t.boolean  "checking_approval"
    t.boolean  "approved"
    t.boolean  "show",                          default: false
    t.string   "background_url",    limit: 255
    t.integer  "rec_list",                                      array: true
  end

  create_table "authorizations", force: :cascade do |t|
    t.integer "user_id"
    t.string  "uid",     limit: 255
  end

  create_table "codes", force: :cascade do |t|
    t.string   "body",       limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "ama_id"
    t.integer  "score",                    default: 0
    t.string   "comment_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry",     limit: 255
    t.integer  "voter_list",                           array: true
  end

  add_index "comments", ["ancestry"], name: "index_comments_on_ancestry", using: :btree

  create_table "mailinfos", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "email",                 limit: 255
    t.string   "school",                limit: 255
    t.string   "dream_school",          limit: 255
    t.integer  "timezone"
    t.string   "major",                 limit: 255
    t.string   "profile_pic_url",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_url",             limit: 255
    t.text     "app_response"
    t.string   "role",                  limit: 255
    t.string   "essay",                 limit: 255
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "encrypted_password",    limit: 128
    t.string   "confirmation_token",    limit: 128
    t.string   "remember_token",        limit: 128
    t.string   "avatar_file_name",      limit: 255
    t.string   "avatar_content_type",   limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "one_liner",             limit: 255
    t.text     "background"
    t.string   "github",                limit: 255
    t.string   "weibo",                 limit: 255
    t.string   "twitter",               limit: 255
    t.string   "wechat",                limit: 255
    t.string   "facebook",              limit: 255
    t.string   "follow_me",             limit: 255
    t.integer  "link_click_count",                  default: 0
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
