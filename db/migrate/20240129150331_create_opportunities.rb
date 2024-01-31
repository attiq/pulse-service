# frozen_string_literal: true

class CreateOpportunities < ActiveRecord::Migration[6.1]
  def change
    create_table :opportunities do |t|
      t.string :procedure_name
      t.integer :patient_id
      t.integer :doctor_id
      t.jsonb :stage_history, default: {}

      t.timestamps
    end
  end
end
