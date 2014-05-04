class Team < ActiveRecord::Base

  has_attached_file :avatar1, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :avatar2, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar2, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :game

end