class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :unfollower_id
      t.integer :unfollowed_id

      t.timestamps
    end
    add_index :relationships, :unfollower_id
    add_index :relationships, :unfollowed_id
    add_index :relationships, [:unfollower_id, :unfollowed_id], unique: true
  end
end
