class Image < ApplicationRecord
  belongs_to :province
  mount_uploader :name, NameUploader
end
