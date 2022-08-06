class Item < ApplicationRecord
  validates :number,
    presence: true
  validates :name,
    presence: true,
    length: { in: 1..40 }
end
