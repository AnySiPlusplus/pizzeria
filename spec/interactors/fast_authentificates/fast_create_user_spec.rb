RSpec.describe FastAuthentificates::FastCreateUser do
  subject(:context) { described_class.call(params: params) }

  describe 'method call' do
    context 'when params valid' do
      let(:params) { ActionController::Parameters.new(users_privacy_email: { email: FFaker::Internet.email }) }

      it 'is create user' do
        expect { context }.to(change(User, :count).from(0).to(1))
      end

      it 'is return user' do
        expect(context.user.present?).to eq(true)
      end
    end

    context 'when params invalid' do
      let(:params) { ActionController::Parameters.new(users_privacy_email: { email: 'wrong_email' }) }

      it 'is not created user' do
        expect { context }.not_to(change(User, :count))
      end

      it 'is return errors form' do
        expect(context.form.present?).to eq(true)
      end
    end
  end
end
