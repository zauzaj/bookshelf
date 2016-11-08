class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text   :description
      t.timestamps null: false
    end
  end
end
