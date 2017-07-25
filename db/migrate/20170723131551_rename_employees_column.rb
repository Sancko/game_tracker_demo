class RenameEmployeesColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :employees, :type, :speciality
  end
end
