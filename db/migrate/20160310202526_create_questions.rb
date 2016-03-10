class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_type_id
      t.integer :survey_id
      t.text :question_text
      t.text :description
      t.integer :order
      t.boolean :required

      t.timestamps null: false
    end
    add_index :questions, :survey_id
  end
end
