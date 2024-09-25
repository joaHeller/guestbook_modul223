class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
