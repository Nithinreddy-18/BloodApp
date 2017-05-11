require 'rails_helper'

describe User, type: :model do
  describe "vaidations" do
    it { is_expected.to validate_presence_of(:email) }
  end
  describe "vaidations" do
    it { is_expected.to validate_presence_of(:name) }
  end
  describe "vaidations" do
    it { is_expected.to validate_presence_of(:phone) }
  end
  describe "vaidations" do
    it { is_expected.to validate_presence_of(:address) }
  end
  describe "vaidations" do
    it { is_expected.to validate_presence_of(:blood_group) }
  end
end