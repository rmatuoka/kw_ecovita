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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110412011940) do

  create_table "banner_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "pub_start"
    t.datetime "pub_end"
    t.integer  "clicks"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.integer  "page_id"
    t.boolean  "published"
    t.integer  "clicks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_images", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.text     "action"
    t.text     "log"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_products", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.decimal  "price",      :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.integer  "address_id"
    t.decimal  "shipping",   :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_banners", :force => true do |t|
    t.integer  "page_id"
    t.integer  "banner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "page_title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.integer  "user_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_images", :force => true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_recommendeds", :force => true do |t|
    t.integer  "product_id"
    t.integer  "recommended_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.decimal  "price",       :precision => 10, :scale => 0
    t.decimal  "discount",    :precision => 10, :scale => 0
    t.text     "features"
    t.text     "description"
    t.text     "usage"
    t.datetime "pub_start"
    t.datetime "pub_end"
    t.integer  "views"
    t.integer  "category_id"
    t.boolean  "published"
    t.string   "tweet_text"
    t.string   "like_link"
    t.string   "video"
    t.integer  "vendas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "sexo"
    t.date     "nascimento"
    t.string   "cpf"
    t.string   "rg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
