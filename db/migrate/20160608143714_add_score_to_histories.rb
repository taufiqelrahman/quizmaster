class AddScoreToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :score, :integer
  end
end
