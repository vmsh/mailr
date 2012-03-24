class CreateAllTables < ActiveRecord::Migration
  def up
	  create_table "contacts", :force => true do |t|
	    t.string   "nick"
	    t.string   "email"
	    t.string   "first_name"
	    t.string   "last_name"
	    t.string   "info"
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	
	  create_table "events", :force => true do |t|
	    t.integer  "user_id"
	    t.integer  "priority"
	    t.text     "description"
	    t.string   "category"
	    t.datetime "start"
	    t.datetime "stop"
	    t.boolean  "allday"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	
	  create_table "folders", :force => true do |t|
	    t.string   "name"
	    t.string   "delim"
	    t.boolean  "haschildren"
	    t.integer  "total"
	    t.integer  "unseen"
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "parent"
	    t.boolean  "shown"
	    t.string   "alter_name"
	    t.integer  "sys"
	  end
	
	  create_table "messages", :id => false, :force => true do |t|
	    t.integer  "folder_id"
	    t.integer  "user_id"
	    t.string   "msg_id"
	    t.string   "from_addr"
	    t.string   "to_addr"
	    t.string   "subject"
	    t.string   "content_type"
	    t.integer  "uid"
	    t.integer  "size"
	    t.boolean  "unseen"
	    t.datetime "date"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	
	  create_table "prefs", :force => true do |t|
	    t.string   "theme"
	    t.string   "locale"
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "msgs_per_page"
	    t.string   "msg_send_type"
	    t.string   "msg_image_view_as"
	    t.string   "msg_image_thumbnail_size"
	  end
	
	  create_table "servers", :force => true do |t|
	    t.string   "name"
	    t.string   "port"
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.boolean  "use_ssl"
	    t.boolean  "use_tls"
	    t.boolean  "for_imap"
	    t.boolean  "for_smtp"
	    t.string   "auth"
	  end
	
	  create_table "users", :force => true do |t|
	    t.string   "login"
	    t.string   "first_name"
	    t.string   "last_name"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "domain"
	  end
	  
	  create_table :links, :force => true do |t|
			t.integer :user_id
			t.integer :lgroup_id
			t.string :name
			t.string :url
			t.string :info
	  end
	  
  end

	def down
		drop_table "contacts"
		drop_table "events"
		drop_table "folders"
		drop_table "prefs"
		drop_table "servers"
		drop_table "users"
		drop_table "links"
	end

end