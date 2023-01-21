# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }
  after_create_commit -> { broadcast_prepend_to 'quotes' }
  after_update_commit -> { broadcast_replace_to 'quotes' }
end
