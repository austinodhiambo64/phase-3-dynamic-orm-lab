require_relative "../config/environment.rb"
require 'active_support/inflector'
require_relative '../lib/interactive_record.rb'

class Student < InteractiveRecord
    self.column_names.each do |col_name|
      attr_accessor col_name.to_sym
    end
  
    def self.find_by(attributes)
      conditions = attributes.map { |attr, value| "#{attr} = '#{value}'" }.join(" AND ")
      sql = "SELECT * FROM #{table_name} WHERE #{conditions}"
      DB[:conn].execute(sql)
    end
  end
  