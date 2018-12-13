class Province < ApplicationRecord
    has_many :images
    has_many :districts
    has_many :subdistricts, through: :districts
end
