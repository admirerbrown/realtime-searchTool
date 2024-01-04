class Analytic < ApplicationRecord
  # app/models/analytic.rb

  #   before_save :update_summary

  validates :ip_address, presence: true
  validates :query, presence: true

end
