module Api
  module Issue
    RSpec.describe EventsController, type: :controller do
      describe "#index" do
        before do
          allow(controller).to receive(:authenticate_user!).and_return(true)
        end

        context "given existant :issue_id" do
          context "that has events associated with" do
            it "responds with :ok (200) and a list os events related" do
              # Arrange
              issue = create :issue, number: 1
              create :event, issue: issue, action: "opened"

              # Act
              get :index, params: { issue_id: 1 }

              # Assert
              expected_json = [{action: "opened", created_at: issue.created_at.iso8601}].to_json

              expect(response.status).to be == 200
              expect(json_response.size).to eq(1)
              expect(response.body).to eq(expected_json)
            end
          end

          context "that doesnt have any events" do
            it "responds with :not_found (404) and an empty list" do
              # Arrange
              create :issue, number: 1

              # Act
              get :index, params: { issue_id: 1 }

              # Assert
              expect(response.status).to be == 404
            end
          end
        end

        context "given non existant :issue_id" do
          it "responds with :404" do
            # Act
            get :index, params: { issue_id: 1 }

            # Assert
            expect(response.status).to be == 404
          end
        end
      end
    end
  end
end