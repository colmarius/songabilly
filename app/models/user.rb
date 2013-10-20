class User < ActiveRecord::Base
  has_secure_password validations: false
  validates :username, presence: true, unless: :guest?
  validates :username, uniqueness: true, allow_blank: true

  validates_confirmation_of :password, if: lambda { |m| !m.guest? && m.password.present? }
  validates_presence_of     :password, on: :create, unless: :guest?
  validates_presence_of     :password_confirmation, if: lambda { |m| !m.guest? && m.password.present? }

  def self.new_guest
    new { |u| u.guest = true }
  end
  
  def name
    guest ? "Guest" : username
  end
end
