class Folder < ApplicationRecord
  has_ancestry
  belongs_to :user
  has_many :posts, -> { order(position: :asc) }, dependent: :destroy

  def tags; self[:tags].present? ? self[:tags].join(',') : ''; end
  def tags=(values); self[:tags] = values.split(','); end

end
