class Task < ApplicationRecord
  validation :status, presence: true, length: {maximum: 255}
  validation :content, presence: true, length: {maximum: 255}
end
