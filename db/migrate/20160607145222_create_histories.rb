class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question_set, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
