class AddEventToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :event, :boolean
    add_column :posts, :event_time, :datetime
    add_column :posts, :event_location, :string
  end
end
