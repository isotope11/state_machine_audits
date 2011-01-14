class StateMachineStateAudit < ActiveRecord::Base
  belongs_to :state_machine_auditable, :polymorphic => true
end
