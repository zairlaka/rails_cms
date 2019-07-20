class AlterUsers < ActiveRecord::Migration[5.2]
  def up
      rename_table("users", "admin_users")
      add_column("admin_users", "username", :string, :limit => 25,
      :after =>"email")
      change_column("admin_users","email", :string, :limit => 100)
      #Ex:- change_column("admin_users", "email", :string, :limit =>25)
      rename_column :admin_users, :password, :hashed_password
      #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
      puts "*** Adding an index ****"
      add_index :admin_users, :username   
      #Ex:- add_index("admin_users", "username")
      puts "#### everything went okey up successfully"
  end

  def down 
    remove_index :admin_users, :username   
    #Ex:- add_index("admin_users", "username")
    rename_column :admin_users, :hashed_password, :password
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    change_column("admin_users","email", :string, :default => '', :null => false)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    remove_column("admin_users", "username")
    rename_table("admin_users", "users")
    puts "#### everything went okey doewn successfully"
  end
end
