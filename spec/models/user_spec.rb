# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:first_name).is_at_least(ApplicationRecord::MIN_STRING_LENGTH) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(ApplicationRecord::MIN_STRING_LENGTH) }
  end

  describe '#db column validation' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_index(:email) }
  end

  describe '#association' do
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to have_one(:location) }
  end

  describe '#accept_nested_attributes_for' do
    it { is_expected.to accept_nested_attributes_for(:location) }
  end
end
