class ChangeActivatedDefaultInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :activated, true
  end
end
