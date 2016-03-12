class CreateTakers < ActiveRecord::Migration
  def change
    create_table :takers do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end
