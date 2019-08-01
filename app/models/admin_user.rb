class AdminUser < ApplicationRecord
    

    has_secure_password # for bcrypt 

    has_and_belongs_to_many :pages
    
    has_many :section_edits
    has_many :section_edits, :through => :section_edits

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    FORBIDDEN_USERNAME = ['fucker','mary','santa'] # just for sake of demonstration

    validates_presence_of :first_name
    validates_length_of :first_name, :maximum => 25
    validates_presence_of :last_name
    validates_length_of :last_name, :maximum => 50
    validates_presence_of :username
    validates_length_of :username, :within => 3..25
    validates_uniqueness_of :username

    #LONG FORM VALIDATOINS 
    # validates_presence_of :email
    # validates_length_of :email, :maximum => 100
    # validates_format_of :email, :with => EMAIL_REGEX
    # validates_confirmation_of :email

    #sexy validation
    validates :email, :presence => true,
		 :length => { :maximum => 50},
		 :uniqueness => true, 
		 :format => { :with => EMAIL_REGEX },
	 	 :confirmation => true

    validate :username_is_allowed # custom validation
    validate :no_new_users_on_monday, :on => :create


    scope :sorted, lambda { order('last_name ASC, first_name ASC')}

    def name
        "#{first_name} #{last_name}"
        # first_name + ' ' + last_name
        # [first_name, last_name].join(' ')
    end

private

def username_is_allowed
    if FORBIDDEN_USERNAME.include?(username)
        errrors.add(:username, "has been restricted from use.")
    end
end
def no_new_users_on_monday
    if Time.now.wday == 1
        errors.add(:base, "no new users on Mondays.")
    end
end

end