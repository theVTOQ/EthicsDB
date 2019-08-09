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

ActiveRecord::Schema.define(version: 4) do

  create_table "action_ethical_arguments", force: :cascade do |t|
    t.integer "possible_action_id"
    t.integer "ethical_argument_id"
  end

  add_index "action_ethical_arguments", ["ethical_argument_id"], name: "index_action_ethical_arguments_on_ethical_argument_id"
  add_index "action_ethical_arguments", ["possible_action_id"], name: "index_action_ethical_arguments_on_possible_action_id"

  create_table "circumstances", force: :cascade do |t|
    t.string  "context"
    t.integer "concerned_party_id"
  end

  add_index "circumstances", ["concerned_party_id"], name: "index_circumstances_on_concerned_party_id"

  create_table "concerned_partys", force: :cascade do |t|
    t.string "identifier"
  end

  create_table "effect_likelihoods", force: :cascade do |t|
    t.string  "attribute"
    t.string  "operation"
    t.decimal "likelihood"
    t.integer "possible_action_id"
    t.integer "concerned_party_id"
  end

  add_index "effect_likelihoods", ["concerned_party_id"], name: "index_effect_likelihoods_on_concerned_party_id"
  add_index "effect_likelihoods", ["possible_action_id"], name: "index_effect_likelihoods_on_possible_action_id"

  create_table "ethical_arguments", force: :cascade do |t|
    t.string  "topic"
    t.string  "title"
    t.string  "summary"
    t.boolean "is_private"
  end

  create_table "imperative_rankings", force: :cascade do |t|
    t.string  "attribute"
    t.string  "operation"
    t.integer "importance_ranking"
    t.integer "concerned_party_id"
  end

  add_index "imperative_rankings", ["concerned_party_id"], name: "index_imperative_rankings_on_concerned_party_id"

  create_table "possible_actions", force: :cascade do |t|
    t.string  "description"
    t.integer "morality_ranking"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ethical_argument_id"
  end

  add_index "subscriptions", ["ethical_argument_id"], name: "index_subscriptions_on_ethical_argument_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
