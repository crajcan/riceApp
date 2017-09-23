class AccessCode < ApplicationRecord
  validates :code, presence: true, length: { minimum: 6, maximum: 25 }, allow_nil: false
end
