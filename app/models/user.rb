class User < ActiveRecord::Base
has_many :reviews
has_many :festivals, through: :review
has_secure_password

validates :username, uniqueness: true
end
