class AddVoteBoolToExamples < ActiveRecord::Migration[6.0]
  def change
    add_column :examples, :vote_bool, :integer , default:0
  end
end
