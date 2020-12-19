# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_19_113722) do

  create_table "articles", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.boolean "edited_article", default: false
    t.boolean "published"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "Firstname"
    t.string "Lastname"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "revision_articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "article_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_revision_articles_on_article_id"
    t.index ["user_id"], name: "index_revision_articles_on_user_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.string "content"
    t.string "title"
    t.integer "article_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_revisions_on_article_id"
    t.index ["user_id"], name: "index_revisions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "points", default: 0.0
  end

  add_foreign_key "articles", "users"
  add_foreign_key "revision_articles", "articles"
  add_foreign_key "revision_articles", "users"
  add_foreign_key "revisions", "articles"
  add_foreign_key "revisions", "users"
end
