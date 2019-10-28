class AddVoteWeightToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :vote_weight, :integer
  end
end
