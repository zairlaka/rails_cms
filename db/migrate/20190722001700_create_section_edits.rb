class CreateSectionEdits < ActiveRecord::Migration[5.2]
  def up
    create_table :section_edits do |t| #now we want the id we have ActiveRecord Model
      #this is the AcitveRecord object insist id
      t.integer :admin_user_id
      t.integer :section_id
      t.string :summary
      t.timestamps
    end
    add_index :section_edits, ['admin_user_id','section_id']
    #Ex:- add_index("admin_users", "username")
  end
  def down 
    drop_table :section_edits
  end
end
