class User < ActiveRecord::Base
has_many :reviews
has_many :festivals, through: :review
has_secure_password

validates :username, uniqueness: true
validates_length_of :username, minimum: 5, maximum: 5, allow_blank: false
end
