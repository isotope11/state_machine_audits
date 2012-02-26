## StateMachineAudits
This gem is meant to be used in conjunction with the state_machine gem in a Rails3 project.  It will hook into before_save and track any state changes that happen in its own database table.

To that end, you need a migration that looks something like this:

    class CreateStateMachineStateAudits < ActiveRecord::Migration
      def self.up
        create_table :state_machine_state_audits do |t|
          t.string :state_machine_auditable_type
          t.integer :state_machine_auditable_id
          t.string :state_field
          t.string :state
          t.timestamps
        end
      end

      def self.down
        drop_table :state_machine_state_audits
      end
    end

After that, you just include the module in your class that uses state_machine like so:

    class SomeClass < ActiveRecord::Base
      include StateMachineAudits
    end

That's it, you're done.  Now it will keep a record of each state transition.
