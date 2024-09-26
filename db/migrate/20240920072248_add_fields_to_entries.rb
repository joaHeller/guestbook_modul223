class AddFieldsToEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :entries, :email, :string
    add_column :entries, :photo, :string
    add_column :entries, :date, :date
  end
end
