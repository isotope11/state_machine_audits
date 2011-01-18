require 'active_record'
require 'active_support'
require 'state_machine'
require 'state_machine_audits'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Base.connection.create_table(:state_machine_state_audits) do |t|
  t.string :state_machine_auditable_type
  t.integer :state_machine_auditable_id
  t.string :state_field
  t.string :state
  t.timestamps
end

ActiveRecord::Base.connection.create_table(:vehicles) do |t|
  t.string :name
  t.string :state
  t.timestamps
end

class Vehicle < ActiveRecord::Base
  include StateMachineAudits

  state_machine :initial => :parked do
    event :ignite do
      transition :parked => :first_gear
    end
  end
end

describe StateMachineStateAudit do

  let( :vehicle ) { Vehicle.new }

  context 'when a state machine event is called on a model' do
    it 'should create a new audit record' do
      lambda { vehicle.ignite }.should change(StateMachineStateAudit, :count).by(1)
    end

    it 'should record the state' do
      vehicle.ignite
      vehicle.state_machine_state_audits.last.state.should == 'first_gear'
    end
  end


  context 'when the class does not inherit from ActiveRecord::Base' do
    it 'should raise an error' do
      lambda do
        class Truck; include StateMachineAudits; end
      end.should raise_error "class must inherit from ActiveRecord::Base"
    end
  end

end
