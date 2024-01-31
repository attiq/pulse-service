# frozen_string_literal: true

class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :procedure_name, :patient_id, :doctor_id, :stage_history
  belongs_to :patient
  belongs_to :doctor
end
