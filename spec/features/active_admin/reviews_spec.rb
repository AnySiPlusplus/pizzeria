RSpec.describe 'Review', type: :feature do
  let(:admin_user) { create(:admin_user) }
  let!(:review) { create(:review) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::Reviews::Index.new }

    before { page.load }

    context 'when admin redirect to index review path' do
      it { expect(page.buttons).to have_all }
      it { expect(page.buttons).to have_unprocessed }
      it { expect(page.buttons).to have_approved }
      it { expect(page.buttons).to have_rejected }
      it { expect(page.buttons).to have_view }
      it { expect(page).to have_content(review.title) }
      it { expect(page).to have_content(review.pizza.name) }
      it { expect(page).to have_content(review.user.email) }
      it { expect(page).to have_content(review.status) }
    end

    context 'when admin click view button' do
      before { page.buttons.view.click }

      it { expect(page).to have_current_path(admin_review_path(review.id)) }
    end

    context 'when admin click button sort by approved' do
      let!(:review_approved) { create(:review, status: 1) }

      before { page.buttons.approved.click }

      it { expect(page).to have_content(review_approved.status) }
      it { expect(page).not_to have_content(review.status) }
    end

    context 'when admin click button sort by rejected' do
      let!(:review_rejected) { create(:review, status: 2) }

      before { page.buttons.rejected.click }

      it { expect(page).to have_content(review_rejected.status) }
      it { expect(page).not_to have_content(review.status) }
    end

    context 'when admin click button sort by unprocessed' do
      let!(:review_approved) { create(:review, status: 1) }

      before { page.buttons.unprocessed.click }

      it { expect(page).to have_content(review.status) }
      it { expect(page).not_to have_content(review_approved.status) }
    end

    context 'when admin click button sort by all' do
      let!(:review_approved) { create(:review, status: 1) }
      let!(:review_rejected) { create(:review, status: 2) }

      before { page.buttons.all.click }

      it { expect(page).to have_content(review.status) }
      it { expect(page).to have_content(review_rejected.status) }
      it { expect(page).to have_content(review_approved.status) }
    end
  end

  describe 'Show' do
    let(:page) { Pages::ActiveAdmin::Reviews::Show.new }

    before { page.load(id: review.id) }

    context 'when admin redirect show path' do
      it { expect(page).to have_content(review.title) }
      it { expect(page).to have_content(review.pizza.name) }
      it { expect(page).to have_content(review.user.email) }
      it { expect(page).to have_content(review.status) }
    end

    context 'when admin addroved review' do
      it { expect { page.buttons.approve.click }.to(change { Review.first.status }) }
    end

    context 'when admin rejected review' do
      it { expect { page.buttons.reject.click }.to(change { Review.first.status }) }
    end
  end
end
