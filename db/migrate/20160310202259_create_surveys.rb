class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :author_id
      t.string :title
      t.text :description
      t.string :token

      t.timestamps null: false
    end
    add_index :surveys, :author_id
  end
end
