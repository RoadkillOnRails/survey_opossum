class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
