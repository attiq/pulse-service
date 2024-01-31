# frozen_string_literal: true

class Member < ApplicationRecord
  enum role: { doctor: 1, patient: 2 }
  enum gender: { male: 1, female: 2 }

  has_many :doctor_opportunities, class_name: 'Opportunity', foreign_key: 'doctor_id'
  has_many :patient_opportunities, class_name: 'Opportunity', foreign_key: 'patient_id'
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :gender, presence: true
  validates :age, presence: true

  attr_accessor :dob

  before_validation :set_age

  def calculate_age
    now = Time.now.utc.to_date
    dob = self.dob.to_date
    age = now.year - dob.year
    age -= 1 if now.month < dob.month || (now.month == dob.month && now.day < dob.day)
    age
  end

  private

  def set_age
    self.age = calculate_age
  end
end
