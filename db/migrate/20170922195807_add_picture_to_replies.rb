class AddPictureToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :picture, :string
  end
end
