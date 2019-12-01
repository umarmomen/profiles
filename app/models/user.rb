class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  def self.courses_list
    return ["CS61A", "CS61B", "CS61C", "EE16A", "EE16B", "CS70", "DATA8"]
  end

  def self.get_secret_key
    return "CS"
  end

end
