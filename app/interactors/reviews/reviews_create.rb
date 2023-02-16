module Reviews
  class ReviewsCreate < BaseInteractor
    def call
      review_form.validate(permited_params) ? review_form.save : context.fail!
    end

    private

    def review_form
      @review_form ||= Reviews::ReviewForm.new(Review.new(user: context.current_user))
    end

    def permited_params
      context.params.require(:review).permit(:rating, :title, :review_text, :user_id, :pizza_id)
    end
  end
end
