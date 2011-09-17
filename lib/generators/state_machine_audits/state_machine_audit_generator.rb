require 'rails/generators/migration'

class StateMachineAuditsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  class << self
    def source_root
      @state_machine_audits_source_root ||= File.expand_path('../templates', __FILE__)
    end

    def next_migration_number path
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end
  end

  def create_model_file
    migration_template 'create_state_machine_audits.rb', 'db/migrate/create_state_machine_audits.rb'
  end
end
