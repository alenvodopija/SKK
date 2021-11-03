class User < ApplicationRecord
    has_secure_password
    has_many :tickets, dependent: :destroy
    validates :email, presence: true
end