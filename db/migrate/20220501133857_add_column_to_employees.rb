class AddColumnToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :number_of_available_kudos, :integer, null: false, default: 0
    end
end
