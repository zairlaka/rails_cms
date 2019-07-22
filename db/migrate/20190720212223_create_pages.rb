class CreatePages < ActiveRecord::Migration[5.2]
  def up
    create_table :pages do |t|

      t.integer :subject_id
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible, :default => false

      t.timestamps
    end
    add_index :pages, :subject_id
    #Ex:- add_index("admin_users", "username")
    add_index :pages, :permalink # for looking up pages so when the user type the url(permalink) we find that corresponding page
    #Ex:- add_index("admin_users", "username")
  end
  def down 
    drop_table :pages
  end
end
