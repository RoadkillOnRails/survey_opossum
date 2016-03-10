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

ActiveRecord::Schema.define(version: 20160310202802) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "authors", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "option"
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id"

  create_table "question_types", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_type_id"
    t.integer  "survey_id"
    t.text     "question_text"
    t.text     "description"
    t.integer  "order"
    t.boolean  "required"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "surveys", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "description"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "surveys", ["author_id"], name: "index_surveys_on_author_id"

end
