# This module assigned to all database operations
module Database
  attr_accessor :db

  require 'sqlite3'
  # This module assigned to create table action
  module Create
    def steam_account_list
      Database.db.execute <<-SQL
    CREATE TABLE steam_account_list (
    accesses VARCHAR (128),
    used INTEGER (1))
      SQL
      true
    rescue SQLite3::SQLException
      false
    end
    module_function(
        :steam_account_list
    )
  end

  def setup
    # Initializing database file
    self.db = SQLite3::Database.open 'autosteam.db'
    # Try to get custom table, if table not exists - create this one
    unless get_table('steam_account_list')
      Create.steam_account_list
    end
  end

  # Get all from the selected table
  # @var table_name
  def get_table(table_name)
    db.execute <<-SQL
    Select * from #{table_name}
    SQL
  rescue SQLite3::SQLException
    false
  end

  module_function(
    :get_table,
    :setup,
    :db,
    :db=
  )
end
