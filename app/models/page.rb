class Page < ApplicationRecord
    
    # subject father 
    belongs_to :subject , { :optional => false } # make it false if you want to add page without a parent object subject 
    #make it false it prevent to add orphan recored in your database that not belongs to any object
    has_many :sections
    has_and_belongs_to_many :admin_users, :join_table => 'admin_users_pages'
    #we can specify the join table if we do not follow rails convention

end
