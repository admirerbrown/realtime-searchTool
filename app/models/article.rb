# frozen_string_literal: true

class Article < ApplicationRecord
  # app/models/article.rb

  include PgSearch::Model

  validates :title, length: { maximum: 255 }, presence: true
  validates :author, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true

  pg_search_scope :full_search,
                  against: {
                    title: 'B',
                    author: 'C',
                    content: 'A'
                  },
                  using: {
                    trigram: {
                      word_similarity: true
                    },
                    tsearch: { prefix: true }
                  }

  def self.hybrid_search(query, ip_address)
    return nil if query.blank? || ip_address.blank?

    AnalyticsService.new.record_search(ip_address, query)

    full_search(query).uniq
  end
end
