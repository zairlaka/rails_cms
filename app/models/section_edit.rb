class SectionEdit < ApplicationRecord
    acts_as_list :scope => :subject
    
    belongs_to :admin_user
    belongs_to :section
end
