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

ActiveRecord::Schema.define(:version => 20120214130706) do

  create_table "banner_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.integer  "banner_category_id"
    t.string   "name"
    t.datetime "pub_start"
    t.datetime "pub_end"
    t.integer  "clicks",             :default => 0
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.string   "gift_cod"
    t.boolean  "used"
    t.datetime "valido"
    t.decimal  "discount",   :precision => 10, :scale => 2
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", :force => true do |t|
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
    t.decimal  "price",      :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "payment_type"
    t.string   "shipping"
    t.string   "pagseguro_id"
    t.string   "rastreamento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipcode"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "neighbourood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "area_code"
    t.string   "phone"
    t.boolean  "completed"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "page_title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages_banners", :id => false, :force => true do |t|
    t.integer  "page_id"
    t.integer  "banner_id"
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
    t.integer  "product_id"
  end

  create_table "product_images", :force => true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.decimal  "price",                   :precision => 10, :scale => 2
    t.decimal  "discount",                :precision => 10, :scale => 2
    t.text     "features"
    t.text     "description"
    t.text     "usage"
    t.datetime "pub_start"
    t.datetime "pub_end"
    t.integer  "views",                                                  :default => 0
    t.integer  "subcategory_id"
    t.boolean  "published"
    t.string   "tweet_text"
    t.string   "like_link"
    t.string   "video"
    t.integer  "vendas",                                                 :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bibliography"
    t.string   "literature_file_name"
    t.string   "literature_content_type"
    t.integer  "literature_file_size"
    t.datetime "literature_updated_at"
  end

  create_table "products_recommendeds", :id => false, :force => true do |t|
    t.integer  "product_id"
    t.integer  "recommended_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer "score"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rate_id"
    t.integer  "rateable_id"
    t.string   "rateable_type", :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["rate_id"], :name => "index_ratings_on_rate_id"
  add_index "ratings", ["rateable_id", "rateable_type"], :name => "index_ratings_on_rateable_id_and_rateable_type"

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

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "payment_type"
    t.string   "shipping"
    t.string   "pagseguro_id"
    t.string   "rastreamento"
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
    t.string   "phone"
    t.string   "cellphone"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "quarter"
    t.string   "perishable_token"
  end

  create_table "wishlists", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
