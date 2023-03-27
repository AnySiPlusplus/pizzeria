RSpec.describe Users::PrivacyPassword do
  subject(:form) { described_class.new(user) }

  let(:user) { create(:user) }

  let(:password) { "#{('a'..'z').to_a.sample(rand(8..29)).join.capitalize}#{rand(1..9)}" }
  let(:password_confirmation) { password }
  let(:current_password) { user.password }

  let(:params) do
    {
      password: password,
      password_confirmation: password_confirmation,
      current_password: current_password
    }
  end

  before { form.validate(params) }

  context 'when params valid' do
    it { expect(form.valid?).to eq(true) }
  end

  context 'when params invalid' do
    describe 'invalid data' do
      let(:password) { 'test' }

      it { expect(form.valid?).to eq(false) }
    end

    describe 'password' do
      let(:password) { 'test' }

      it { expect(form.errors[:password]).to include(I18n.t('errors.messages.password_length', length: 8)) }
      it { expect(form.errors[:password]).to include(I18n.t('errors.users.invalid.password')) }
    end

    describe 'confirmation_passwoed' do
      let(:password_confirmation) { 'test' }

      it { expect(form.errors[:password_confirmation]).to include(I18n.t('errors.messages.password_confirmation')) }
    end
  end
end
