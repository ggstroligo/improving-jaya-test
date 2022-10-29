module Api
  module Issue
    RSpec.describe EventsController do
      describe "#index" do
        context "given existant :issue_id" do
          context "that has events associated with" do
            it "responds with :ok (200) and a list os events related" do
              # Arrange
              issue = create :issue, number: 1
              create :event, actionable: issue, action: 'opened'

              # Act
              get :index, params: { issue_id: 1 }

              # Assert
              expect(response.status).to be == 200
              expect(json_response).to match({action: 'opened'})
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