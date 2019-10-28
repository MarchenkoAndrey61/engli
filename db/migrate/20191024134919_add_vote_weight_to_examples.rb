class AddVoteWeightToExamples < ActiveRecord::Migration[6.0]
  def change
    add_column :examples, :vote_weight, :integer
  end
end
