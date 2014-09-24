class AddNameStatusToServernodes < ActiveRecord::Migration
  def change
    add_column :servernodes, :name, :string
    add_column :servernodes, :status, :string
  end
end
