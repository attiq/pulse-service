# frozen_string_literal: true

module Authenticator
  extend ActiveSupport::Concern

  def authenticated?(request)
    get_token(request)
    User.find(@token['sub']).present?
  rescue StandardError
    false
  end

  def get_token(request)
    @token ||= JWT.decode(request.headers['Authorization'].split(' ').last,
                              Rails.application.credentials.devise_jwt_secret_key!).first
  end
end
