class Request < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  enum admin_status: { 要対応: 0, 対応済: 1 }
end
