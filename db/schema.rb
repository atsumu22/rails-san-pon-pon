# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_22_023140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stamp_rally_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stamp_rally_id"], name: "index_participants_on_stamp_rally_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "shop_participants", force: :cascade do |t|
    t.bigint "stamp_rally_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "qr_code"
    t.integer "status", default: 0
    t.index ["shop_id"], name: "index_shop_participants_on_shop_id"
    t.index ["stamp_rally_id"], name: "index_shop_participants_on_stamp_rally_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.string "category_icon"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "stamp_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "participant_id", null: false
    t.integer "status", default: 0
    t.bigint "stamp_rally_id", null: false
    t.index ["participant_id"], name: "index_stamp_cards_on_participant_id"
    t.index ["stamp_rally_id"], name: "index_stamp_cards_on_stamp_rally_id"
  end

  create_table "stamp_rallies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "attend_shops", default: [], array: true
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.text "reward"
    t.index ["user_id"], name: "index_stamp_rallies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "street_name"
    t.string "location"
    t.text "street_description"
    t.integer "status", default: 0
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "participants", "stamp_rallies"
  add_foreign_key "participants", "users"
  add_foreign_key "shop_participants", "shops"
  add_foreign_key "shop_participants", "stamp_rallies"
  add_foreign_key "shops", "users"
  add_foreign_key "stamp_cards", "participants"
  add_foreign_key "stamp_cards", "stamp_rallies"
  add_foreign_key "stamp_rallies", "users"
end
