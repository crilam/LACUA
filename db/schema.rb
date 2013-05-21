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
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130506213518) do

  create_table "categories", :force => true do |t|
    t.string   "nombre"
=======
ActiveRecord::Schema.define(:version => 20130521221415) do

  create_table "categories", :force => true do |t|
    t.string   "name"
>>>>>>> 93689857fef5684a49d82a1597f60f3c20b5577a
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cloths", :force => true do |t|
    t.string   "distintion"
    t.string   "height"
<<<<<<< HEAD
    t.string   "widht"
=======
    t.string   "width"
>>>>>>> 93689857fef5684a49d82a1597f60f3c20b5577a
    t.string   "depth"
    t.string   "color"
    t.string   "feston"
    t.string   "tipo"
<<<<<<< HEAD
    t.integer  "categoty_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
=======
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.string   "description"
>>>>>>> 93689857fef5684a49d82a1597f60f3c20b5577a
  end

  create_table "inventories", :force => true do |t|
    t.string   "sub_location"
    t.integer  "location_id"
    t.integer  "amount"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "inventories_clothes", :id => false, :force => true do |t|
    t.integer "inventory_id"
    t.integer "cloth_id"
    t.integer "amount"
  end

  create_table "locations", :force => true do |t|
    t.string   "codigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
<<<<<<< HEAD
=======
    t.string   "name"
>>>>>>> 93689857fef5684a49d82a1597f60f3c20b5577a
  end

end