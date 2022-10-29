require 'rails_helper'

RSpec.describe IssueEventSerializer do
  describe ".[]" do
    it "returns a serialized event hash" do
      # Arrange
      event = create :event

      # Act
      result = described_class[event]

      # Assert
      expected_created_at = event.created_at.iso8601

      expect(result).to be_a(Hash)
      expect(result.keys).to eq([:action, :created_at])
      expect(result[:action]).to eq("opened")
      expect(result[:created_at]).to eq(expected_created_at)
    end
  end

end