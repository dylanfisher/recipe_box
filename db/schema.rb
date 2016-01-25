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

ActiveRecord::Schema.define(version: 20160125024322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "boxes_recipes", id: false, force: :cascade do |t|
    t.integer "box_id",    null: false
    t.integer "recipe_id", null: false
  end

  add_index "boxes_recipes", ["box_id", "recipe_id"], name: "index_boxes_recipes_on_box_id_and_recipe_id", using: :btree
  add_index "boxes_recipes", ["recipe_id", "box_id"], name: "index_boxes_recipes_on_recipe_id_and_box_id", using: :btree

  create_table "color_schemes", force: :cascade do |t|
    t.string   "title"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines_recipes", id: false, force: :cascade do |t|
    t.integer "cuisine_id", null: false
    t.integer "recipe_id",  null: false
  end

  add_index "cuisines_recipes", ["cuisine_id", "recipe_id"], name: "index_cuisines_recipes_on_cuisine_id_and_recipe_id", using: :btree
  add_index "cuisines_recipes", ["recipe_id", "cuisine_id"], name: "index_cuisines_recipes_on_recipe_id_and_cuisine_id", using: :btree

  create_table "diets", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diets_recipes", id: false, force: :cascade do |t|
    t.integer "diet_id",   null: false
    t.integer "recipe_id", null: false
  end

  add_index "diets_recipes", ["diet_id", "recipe_id"], name: "index_diets_recipes_on_diet_id_and_recipe_id", using: :btree
  add_index "diets_recipes", ["recipe_id", "diet_id"], name: "index_diets_recipes_on_recipe_id_and_diet_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "title"
    t.string   "amount"
    t.integer  "position"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ingredients", ["recipe_id", "position"], name: "index_ingredients_on_recipe_id_and_position", using: :btree
  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

  create_table "jewels", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "meal_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_types_recipes", id: false, force: :cascade do |t|
    t.integer "meal_type_id", null: false
    t.integer "recipe_id",    null: false
  end

  add_index "meal_types_recipes", ["meal_type_id", "recipe_id"], name: "index_meal_types_recipes_on_meal_type_id_and_recipe_id", using: :btree
  add_index "meal_types_recipes", ["recipe_id", "meal_type_id"], name: "index_meal_types_recipes_on_recipe_id_and_meal_type_id", using: :btree

  create_table "occasions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occasions_recipes", id: false, force: :cascade do |t|
    t.integer "occasion_id", null: false
    t.integer "recipe_id",   null: false
  end

  add_index "occasions_recipes", ["occasion_id", "recipe_id"], name: "index_occasions_recipes_on_occasion_id_and_recipe_id", using: :btree
  add_index "occasions_recipes", ["recipe_id", "occasion_id"], name: "index_occasions_recipes_on_recipe_id_and_occasion_id", using: :btree

  create_table "pairings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pairings_recipes", id: false, force: :cascade do |t|
    t.integer "pairing_id", null: false
    t.integer "recipe_id",  null: false
  end

  add_index "pairings_recipes", ["pairing_id", "recipe_id"], name: "index_pairings_recipes_on_pairing_id_and_recipe_id", using: :btree
  add_index "pairings_recipes", ["recipe_id", "pairing_id"], name: "index_pairings_recipes_on_recipe_id_and_pairing_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "jewel_id"
    t.integer  "color_scheme_id"
    t.string   "title"
    t.text     "description"
    t.text     "notes"
    t.text     "acknowledgements"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "slug"
  end

  add_index "recipes", ["color_scheme_id"], name: "index_recipes_on_color_scheme_id", using: :btree
  add_index "recipes", ["jewel_id"], name: "index_recipes_on_jewel_id", using: :btree
  add_index "recipes", ["slug"], name: "index_recipes_on_slug", unique: true, using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "recipes_seasons", id: false, force: :cascade do |t|
    t.integer "season_id", null: false
    t.integer "recipe_id", null: false
  end

  add_index "recipes_seasons", ["recipe_id", "season_id"], name: "index_recipes_seasons_on_recipe_id_and_season_id", using: :btree
  add_index "recipes_seasons", ["season_id", "recipe_id"], name: "index_recipes_seasons_on_season_id_and_recipe_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.text     "description"
    t.integer  "position"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "steps", ["recipe_id", "position"], name: "index_steps_on_recipe_id_and_position", using: :btree
  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups_users", id: false, force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "user_group_id", null: false
  end

  add_index "user_groups_users", ["user_group_id", "user_id"], name: "index_user_groups_users_on_user_group_id_and_user_id", using: :btree
  add_index "user_groups_users", ["user_id", "user_group_id"], name: "index_user_groups_users_on_user_id_and_user_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.string   "location"
    t.boolean  "activated",              default: false, null: false
    t.string   "greeting"
    t.string   "website"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "color_schemes"
  add_foreign_key "recipes", "jewels"
  add_foreign_key "recipes", "users"
  add_foreign_key "steps", "recipes"
end
