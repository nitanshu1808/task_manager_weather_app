require 'rails_helper'

RSpec.describe JsonWebToken do
  let(:payload) { { user_id: 1 } }

  context '.encode' do
    subject { described_class.encode(payload) }

    it { is_expected.not_to be_nil }
  end

  context '.decode' do
    subject { described_class.decode(token) }

    let(:token) do
      described_class.encode(payload, 1.hours.from_now)
    end

    it 'verifies the payload returned' do
      expect(subject.dig(:user_id)).to eql(payload.dig(:user_id))
    end
  end
end
