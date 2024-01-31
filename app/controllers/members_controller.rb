# frozen_string_literal: true

class MembersController < ApplicationController
  # GET /members
  def index
    @members = Member.all

    render json: @members, each_serializer: MemberSerializer
  end

  # POST /members
  def create
    @member = Member.new(refine_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  private

  def refine_params
    params = member_params
    role = params.delete(:role)
    gender = params.delete(:gender)
    params[:role] = role.to_i
    params[:gender] = gender.to_i
    params
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:first_name, :last_name, :gender, :dob, :role, :avatar)
  end
end
