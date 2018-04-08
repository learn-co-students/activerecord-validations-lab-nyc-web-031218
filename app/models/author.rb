class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: { is: 10 }
  validates :id, uniqueness: true
  # validates :id, uniqueness: true
end
