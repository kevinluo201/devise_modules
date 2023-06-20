class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :validatable
end
