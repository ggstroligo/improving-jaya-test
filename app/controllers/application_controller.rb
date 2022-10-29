class ApplicationController < ActionController::API
  include WebhookAuth
  include BasicUserAuth
end
