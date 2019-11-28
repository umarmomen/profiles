class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  def self.courses_list
    return ['CS61A']
  end

  def self.get_secret_key
    return "CS"
  end

end
