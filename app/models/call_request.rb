class CallRequest < ActiveRecord::Base
  belongs_to :user

  RESPONSES = {
    not_found: 'No estoy en la oficina',
    not_appointment: 'No tiene cita'
  }

  def to
    user
  end

  def has_response?
    self.response.present?
  end
end
