class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  validates_formatting_of :email, :using => :email
  validates_presence_of :name
  has_many :reminders_to, :class_name => "Reminder", :foreign_key => "to_user_id"
  has_many :reminders_from, :class_name => "Reminder", :foreign_key => "from_user_id"
  has_many :affiliations
  has_many :things, :through => :affiliations
end
