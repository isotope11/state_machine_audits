class CreateStateMachineStateAudits < ActiveRecord::Migration
  def self.up
    create_table :state_machine_state_audits do |t|
      t.string  :state_machine_auditable_type
      t.integer :state_machine_auditable_id
      t.string  :state_field
      t.string  :state
      t.timestamps
    end
  end

  def self.down
    drop_table :state_machine_state_audits
  end
end
