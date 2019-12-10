class User < ApplicationRecord
  has_secure_password
  has_attached_file :image
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /\A[\w+\-.]+@berkeley.edu/}, :on => :create
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  
  def self.courses_list
    return ["CS61A", "CS61B", "CS61C", "EE16A", "EE16B", "CS70", "DATA8"]
  end

  def self.get_secret_key
    return "CS"
  end

end
