module Reviews
  class ReviewForm < BaseForm
    ONE_STAR = 1
    MAX_STARS = 5
    MAXIMUM_TITLE_LENGTH = 50
    MAXIMUM_REVIEW_LENGRH = 500

    REGEXP_FILDS = /\A[a-z|0-9\W]+\z/i

    property :title
    property :pizza_id
    property :rating
    property :review_text

    validates :title, presence: true, length: { maximum: MAXIMUM_TITLE_LENGTH },
                      format: { with: REGEXP_FILDS }
    validates :review_text, presence: true, length: { maximum: MAXIMUM_REVIEW_LENGRH },
                            format: { with: REGEXP_FILDS }

    validates :rating, numericality: { less_than_or_equal_to: MAX_STARS }
  end
end
