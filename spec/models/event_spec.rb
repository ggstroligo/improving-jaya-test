require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :action }
  end

  describe "Relationships" do
    it { is_expected.to belong_to(:issue) }
  end
end