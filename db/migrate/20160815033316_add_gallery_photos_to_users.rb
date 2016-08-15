class AddGalleryPhotosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gallery_photos, :json
  end
end
