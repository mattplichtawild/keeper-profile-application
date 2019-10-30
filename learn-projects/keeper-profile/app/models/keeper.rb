class Zookeeper < ActiveRecord::Base
    has_secure_password
    validates_presence_of :first_name, :last_name, :email, :password
    has_many :animals
end