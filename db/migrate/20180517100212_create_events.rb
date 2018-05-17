class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :price, :integer
      t.column :location, :string

      t.timestamps
    end
  end
end
