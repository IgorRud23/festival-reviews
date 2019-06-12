class User < ActiveRecord::Base
has_many :reviews
has_many :festivals, through: :review
has_secure_password

validates :user_name, uniqueness: true
validates_length_of :user_name, minimum: 3, maximum: 15, allow_blank: true
validates_length_of :password, minimum: 5, maximum: 15, allow_blank: true
end
