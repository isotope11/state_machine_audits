class StateMachineStateAudit < ActiveRecord::Base
  belongs_to :state_machine_auditable, :polymorphic => true
  attr_accessible :state, :state_field
end
