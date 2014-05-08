class CostumePhoto < ActiveRecord::Base

  has_many :votes
  before_save :capitalize_title
  validates :title, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  private

  def capitalize_title
    self.title = self.title.split.map(&:capitalize).join(' ')
  end
end
