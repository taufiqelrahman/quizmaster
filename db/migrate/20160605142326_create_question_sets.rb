class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.string :name
      t.string :desc
      t.references :question_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
