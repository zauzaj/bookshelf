require 'active_record'
require 'yaml'

db_config = YAML::load(IO.read('config/database.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)

ActiveRecord::Schema.define(version: 20161108140517) do

  create_table "books", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string 'email',                  default: ''
    t.string 'encrypted_password',     default: '', null: false
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count',          default: 0,  null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'provider',               default: '', null: false
    t.string 'uid',                    default: '', null: false
    t.string 'nickname',               default: '', null: false
    t.string 'name',                   default: '', null: false
    t.string 'favorite_color',         default: '', null: false
    t.text 'tokens'
  end

end
