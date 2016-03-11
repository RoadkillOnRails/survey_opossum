class AddTakerIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :taker_id, :integer
    add_index :answers, :taker_id
  end
end
