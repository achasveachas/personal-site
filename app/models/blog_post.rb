class BlogPost < ApplicationRecord
    validates :slug, uniqueness: true
end
