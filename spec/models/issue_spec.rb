require 'rails_helper'

RSpec.describe Issue do
  describe "Validations" do
    subject { described_class.new(number: 1, title: "Title") }

    it { should validate_uniqueness_of :number }
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_presence_of :title }
  end

  describe "Relationships" do
    it { is_expected.to have_many(:events) }
  end
end