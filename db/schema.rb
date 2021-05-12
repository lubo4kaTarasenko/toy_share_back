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

ActiveRecord::Schema.define(version: 20_210_429_072_854) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'product_id'
    t.bigint 'user_id'
    t.index ['product_id'], name: 'index_comments_on_product_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'images', force: :cascade do |t|
    t.string 'url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'product_id'
    t.index ['product_id'], name: 'index_images_on_product_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.text 'body'
    t.string 'kind'
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_notifications_on_user_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'kind'
    t.bigint 'category_id'
    t.bigint 'subcategory_id'
    t.bigint 'user_id'
    t.string 'status'
    t.string 'url_name'
    t.index ['category_id'], name: 'index_products_on_category_id'
    t.index ['subcategory_id'], name: 'index_products_on_subcategory_id'
    t.index ['user_id'], name: 'index_products_on_user_id'
  end

  create_table 'subcategories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'category_id'
    t.index ['category_id'], name: 'index_subcategories_on_category_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.string 'avatar'
    t.integer 'telegram_chat_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'products'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'images', 'products'
  add_foreign_key 'notifications', 'users'
  add_foreign_key 'products', 'categories'
  add_foreign_key 'products', 'subcategories'
  add_foreign_key 'products', 'users'
  add_foreign_key 'subcategories', 'categories'
end
