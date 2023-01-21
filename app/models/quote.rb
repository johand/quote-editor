# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }
  after_create_commit lambda {
                        broadcast_prepend_to 'quotes',
                                             partial: 'quotes/quote',
                                             locals: { quote: self },
                                             target: 'quotes'
                      }
end
