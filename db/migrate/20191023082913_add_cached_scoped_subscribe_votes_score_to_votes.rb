class AddCachedScopedSubscribeVotesScoreToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :cached_scoped_subscribe_votes_score, :integer, default: 0
  end
end
