ActiveAdmin.register Review do
  permit_params :title, :review_text, :rating, :status, :date, :pizza_id, :user_id

  controller do
    def scoped_collection
      action_name == ACTION_INDEX ? super.includes(%i[pizza user]) : super
    end
  end

  actions :index, :show, :update

  scope :all
  scope(:unprocessed)
  scope(:approved)
  scope(:rejected)

  action_item :approve, only: :show do
    link_to I18n.t('review.button.approve'), approve_admin_review_path(review), method: :put
  end

  action_item :reject, only: :show do
    link_to I18n.t('review.button.reject'), reject_admin_review_path(review), method: :put
  end

  member_action :approve, method: :put do
    review = Review.find(params[:id])
    review.approved!
    redirect_to admin_review_path(review)
  end

  member_action :reject, method: :put do
    review = Review.find(params[:id])
    review.rejected!
    redirect_to admin_review_path(review)
  end

  index do
    selectable_column

    column :pizza
    column :title
    column :created_at
    column :user
    column :status

    actions
  end

  show do
    attributes_table do
      row :pizza
      row :title
      row :created_at
      row :user
      row :status
    end
  end
end
