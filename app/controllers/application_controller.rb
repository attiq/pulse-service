# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :check_if_authorized

  include Authenticator

  def token
    @token ||= get_token(request)
  end

  def current_user
    @token
  end

  private

  def check_if_authorized
    error = nil

    if authenticated?(request)
      token
    else
      error = 'Invalid Token'
    end

    render json: { errors: [error] }.to_json, status: 401 unless error.nil?
  end
end
