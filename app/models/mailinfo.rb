class Mailinfo < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :question, presence: true
end
