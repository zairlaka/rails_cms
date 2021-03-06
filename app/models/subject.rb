class Subject < ApplicationRecord

    has_many :pages

    #scope lambda syntax

    scope :visible , lambda {where(:visible => true) }
    scope :invisible , lambda { where(:visible => false) }
    scope :sorted , lambda { order("position ASC") }
    scope :newest_first , lambda { order(:created_at => :desc ) }
    scope :search , lambda { |query| where(["name LIKE ?", "%#{query}%"] ) }

    validates_presence_of :name #space also consider blank 
    validates_length_of :name, :maximum => 255

end
