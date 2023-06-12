RSpec.describe Users::SignUpForm do
  subject(:form) { described_class.new(User.new) }

  before { form.validate(params) }

  let(:params) do
    {
      email:,
      password:,
      password_confirmation:
    }
  end
  let(:email) {  FFaker::Internet.email }
  let(:password) { 'Password1' }
  let(:password_confirmation) { 'Password1' }

  context 'when params valid' do
    it { expect(form.valid?).to eq(true) }
  end

  context 'when params invalid' do
    describe 'invalid data' do
      let(:email) { 'test' }

      it { expect(form.valid?).to eq(false) }
    end

    describe 'email' do
      let(:email) { 'test' }

      it { expect(form.errors[:email]).to include(I18n.t('errors.messages.email_invalid')) }
    end

    describe 'password' do
      let(:password) { 'test' }

      it { expect(form.errors[:password]).to include(I18n.t('errors.messages.password_length', length: 8)) }
      it { expect(form.errors[:password]).to include(I18n.t('errors.user.invalid.password')) }
    end

    describe 'confirmation_passwoed' do
      let(:password_confirmation) { 'test' }

      it { expect(form.errors[:password_confirmation]).to include(I18n.t('errors.messages.password_confirmation')) }
    end
  end
end
