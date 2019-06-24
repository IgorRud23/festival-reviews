class User < ActiveRecord::Base
has_many :reviews
has_many :festivals, through: :reviews
has_secure_password

validates :password, presence: true  
validates :user_name, uniqueness: true
validates_length_of :user_name, minimum: 3, maximum: 15, allow_blank: true
validates_length_of :password, minimum: 3, maximum: 15, allow_blank: true
end
