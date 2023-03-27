RSpec.describe Users::PrivacyEmail do
  subject(:form) { described_class.new(User.new) }

  before { form.validate(params) }

  let(:params) do
    {
      email: email
    }
  end
  let(:email) { FFaker::Internet.email }

  context 'when params valid' do
    it { expect(form.valid?).to eq(true) }
  end

  context 'when params invalid' do
    describe 'invalid data' do
      let(:email) { 'test' }

      it { expect(form.valid?).to eq(false) }
      it { expect(form.errors[:email]).to include(I18n.t('errors.users.invalid.email')) }
    end
  end
end
