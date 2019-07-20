class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|

      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false
      #Ex:- :null => false
      #Ex:- :default =>''
      t.string "password", :limit => 40
    
      t.timestamps
      # t.string "created_at"
      # t.string "updated_at"   same as timestamps 
      # id will automatically add if u not want to added
      #create_table :users, :id => false do |t|
    end
  end
  def down 
    drop_table :users
  end
end
