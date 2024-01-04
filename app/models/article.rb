# frozen_string_literal: true

class Article < ApplicationRecord
  # app/models/article.rb

  include PgSearch::Model

  validates :title, length: { maximum: 255 }, presence: true
  validates :author, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true

  # pg_search_scope :exact_search,
  #                 against: %i[title author content],
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }

  # pg_search_scope :fuzzy_search,
  #                 against: {
  #                   title: 'B',
  #                   author: 'C',
  #                   content: 'A'
  #                 },
  #                 using: {
  #                   trigram: {
  #                     word_similarity: true
  #                   }
  #                 }

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

  # def self.hybrid_search(query)
  #   fuzzy_results = fuzzy_search(query)
  #   exact_results = exact_search(query)

  #   # Combine results and remove duplicates
  #   (fuzzy_results + exact_results).uniq
  # end

  def self.hybrid_search(query)
    full_search(query).uniq
  end
end
