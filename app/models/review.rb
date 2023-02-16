class Review < ApplicationRecord
  belongs_to :pizza
  belongs_to :user

  enum :status, { unprocessed: 0, approved: 1, rejected: 2 }, default: :unprocessed
end
