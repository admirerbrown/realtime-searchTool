class Analytic < ApplicationRecord
  # app/models/analytic.rb

  validates :ip_address, presence: true
  validates :query, presence: true
end
