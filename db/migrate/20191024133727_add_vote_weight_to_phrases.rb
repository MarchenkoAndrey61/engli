class AddVoteWeightToPhrases < ActiveRecord::Migration[6.0]
  def change
    add_column :phrases, :vote_weight, :integer
  end
end
