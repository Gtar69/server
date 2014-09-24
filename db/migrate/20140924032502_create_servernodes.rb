class CreateServernodes < ActiveRecord::Migration
  def change
    create_table :servernodes do |t|

      t.timestamps
    end
  end
end
