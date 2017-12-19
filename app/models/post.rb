class Post < ApplicationRecord
  belongs_to :folder
  acts_as_list scope: :folder
  belongs_to :user
end
