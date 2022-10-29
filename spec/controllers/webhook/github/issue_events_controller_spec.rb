require 'rails_helper'

module Webhook
  module Github
    RSpec.describe IssueEventsController do
      describe "#create" do
        before do
          # This is needed because, was necessary to override default params method on controller
          allow(controller).to receive(:params).and_return(payload)
          allow(controller).to receive(:authenticate_webhook!).and_return(true)
        end

        context "given valid event" do
          let(:payload) { { action: 'opened', issue: { number: 1, title: 'A new issue' } } }

          it "responds with :created (201) code" do
            post :create, params: payload

            expect(response.status).to be == 201
          end
        end

        context "given event that is not related to issue" do
          let(:payload) { {} }

          it "responds with :unprocessable_entity (422) code" do
            post :create, params: payload

            expect(response.status).to be == 422
          end
        end
      end
    end
  end
end