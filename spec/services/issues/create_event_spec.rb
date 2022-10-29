require "rails_helper"

module Issues
  RSpec.describe CreateEvent do
    describe "#call" do
      subject { described_class.new(**params) }
      let(:params) { { event_action: "opened", issue_number: 1, issue_title: "New title" } }

      it "creates both Issue and Event" do
        expect {subject.call}.to change { Event.count}.by(1)
        .and change { Issue.count }.by(1)
      end

      context "given existant issue number but with diff title" do
        let(:params) { { event_action: "opened", issue_number: issue.number, issue_title: "EDITED TITLE" } }
        let!(:issue) { create :issue, title: "OLD TITLE" }

        it "do not creates new issue but updates his title" do
          expect { subject.call }.to change  { issue.reload.title }.from("OLD TITLE").to("EDITED TITLE")
                                 .and change { Issue.count }.by(0)
                                 .and change { Event.count }.by(1)
        end
      end
    end
  end
end