class UserPhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :bird
  has_attached_file :attachment, styles: { big: '600x600>' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def author
    user.name
  end
end
