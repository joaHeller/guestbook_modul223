class AddDateToEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :entries, :date, :date
  end
end
