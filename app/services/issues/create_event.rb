module Issues
  class CreateEvent
    def initialize(event_action:, issue_number:, issue_title:)
      @action = event_action
      @issue_number = issue_number
      @issue_title = issue_title
    end

    private attr_reader :action, :issue_number, :issue_title

    def call
      ActiveRecord::Base.transaction do
        issue = Issue.find_or_initialize_by(number: issue_number).tap do |record|
          record.title = issue_title
        end

        issue.save!

        Event.create!(issue:, action:)
      end
    end
  end
end