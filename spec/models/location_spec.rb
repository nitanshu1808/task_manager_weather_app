# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_length_of(:name).is_at_least(ApplicationRecord::MIN_STRING_LENGTH) }
  end

  describe '#db column validation' do
    it { is_expected.to have_db_column(:lat).of_type(:float) }
    it { is_expected.to have_db_column(:lng).of_type(:float) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe '#association' do
    it { is_expected.to belong_to(:user) }
  end
end
