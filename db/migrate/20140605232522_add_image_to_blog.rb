class AddImageToBlog < ActiveRecord::Migration
  def change
    add_attachment :blogs, :image
  end
end
