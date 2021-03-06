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

ActiveRecord::Schema.define(version: 2019_08_25_165703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.string "author", null: false
    t.string "cipher", null: false
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "publishingHouse", null: false
    t.date "publishingYear", null: false
    t.integer "price", null: false
    t.date "receiptDate", null: false
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "surname", null: false
    t.string "name", null: false
    t.string "middleName"
    t.date "birthDate", null: false
    t.date "employmentDate", null: false
    t.string "position", null: false
    t.string "education"
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_employees_on_library_id"
  end

  create_table "issuances", force: :cascade do |t|
    t.date "issueDate"
    t.date "returnDate"
    t.bigint "book_id"
    t.bigint "subscriber_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_issuances_on_book_id"
    t.index ["subscriber_id"], name: "index_issuances_on_subscriber_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", default: " ", null: false
    t.string "address", default: " ", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.integer "ticketnumber", null: false
    t.string "surname", null: false
    t.string "name", null: false
    t.string "middleName"
    t.string "address", null: false
    t.string "phone"
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_subscribers_on_library_id"
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "employees", "libraries"
  add_foreign_key "issuances", "books"
  add_foreign_key "issuances", "subscribers"
  add_foreign_key "subscribers", "libraries"
end
