module Webhook
  module Github
    RSpec.describe IssueEventsController do
      describe "#create" do
        context "given valid event" do
          it "responds with :created (201) code" do
            post :create

            expect(response.status).to be == 201
          end
        end

        context "given event that is not related to issue" do
          it "responds with :unprocessable_entity (422) code" do
            request_body = {}
            post :create, params: request_body

            expect(response.status).to be == 422
          end
        end
      end
    end
  end
end