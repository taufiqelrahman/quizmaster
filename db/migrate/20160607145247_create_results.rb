class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :user_answer
      t.string :user_result
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :history, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
