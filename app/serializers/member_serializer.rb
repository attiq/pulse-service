# frozen_string_literal: true

class MemberSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :gender, :age, :role, :avatar_url

  def avatar_url
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end
end
