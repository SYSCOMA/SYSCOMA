class Ticket < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4 }
  validates :text, presence: true, length: { minimum: 5 }

  belongs_to :author, class_name: "User", polymorphic: true
  has_one :answer, class_name: "Ticket"
end
