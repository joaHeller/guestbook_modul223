class AddTitleToEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :entries, :title, :string
  end
end
