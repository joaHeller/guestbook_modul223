class AddFieldsToEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :entries, :email, :string
    add_column :entries, :photo, :string
  end
end
