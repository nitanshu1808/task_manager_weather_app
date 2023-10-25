require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:due_date) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_length_of(:title).is_at_least(ApplicationRecord::MIN_STRING_LENGTH) }
  end

  describe '#db column validation' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:due_date).of_type(:datetime) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe '#association' do
    it { is_expected.to belong_to(:user) }
  end
end
