class AddReadedToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :readed, :boolean
  end
end
