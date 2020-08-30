class Genre < ApplicationRecord
	has_many :blogs, dependent: :destroy
end
