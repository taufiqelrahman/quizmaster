class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
      t.string :name
      t.string :desc

      t.timestamps null: false
    end
  end
end
