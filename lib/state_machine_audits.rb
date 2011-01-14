require 'state_machine_audits/state_machine_state_audit'

module StateMachineAudits
  extend ActiveSupport::Concern

  included do
    after_save :store_state_machine_audit
    has_many :state_machine_state_audits, :as => :state_machine_auditable
  end

  def store_state_machine_audit
    self.class.state_machines.keys.each do |_state|
      if self.changes.include?(_state.to_s)
        the_new_state = self.changes[_state].last
        self.state_machine_state_audits.create(:state => the_new_state, :state_field => _state.to_s)
        Rails.logger.warn "AUDITING STATE: #{_state} - #{the_new_state}" if Rails.env.development?
      end
    end
  end
end
