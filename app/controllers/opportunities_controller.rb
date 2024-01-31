# frozen_string_literal: true

class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[update destroy]

  # GET /opportunities
  def index
    @opportunities = Opportunity.all

    render json: @opportunities, each_serializer: OpportunitySerializer
  end

  # GET /opportunities/1
  def show
    @opportunity = Opportunity.includes(:patient, :doctor).find(params[:id])

    render json: @opportunity.to_json(include: %i[patient doctor])
  end

  # POST /opportunities
  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      render json: @opportunity, status: :created, location: @opportunity
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /opportunities/1
  def update
    if @opportunity.update(opportunity_params)
      render json: @opportunity
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /opportunities/1
  def destroy
    @opportunity.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opportunity_params
    params.require(:opportunity).permit(:procedure_name, :patient_id, :doctor_id, :stage, stage_history: {})
  end
end
