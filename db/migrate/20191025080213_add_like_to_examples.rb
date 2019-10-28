class AddLikeToExamples < ActiveRecord::Migration[6.0]
  def change
    add_column :examples, :like, :integer, default: 0
  end
end
