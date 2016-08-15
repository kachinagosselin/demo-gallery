class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable #:invitable, :confirmable,:validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploaders :gallery_photos, GalleryPhotoUploader

  def description
  end
end
