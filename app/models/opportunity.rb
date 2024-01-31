# frozen_string_literal: true

class Opportunity < ApplicationRecord
  belongs_to :patient, class_name: 'Member'
  belongs_to :doctor, class_name: 'Member'

  validates :procedure_name, presence: true
  validates :doctor_id, presence: true
  validates :patient_id, presence: true

  attr_accessor :stage

  before_save :set_stage_history

  private

  def set_stage_history
    return unless stage.present?

    stage_history.merge!({ "#{stage}": Time.now.utc.to_time })
  end
end
