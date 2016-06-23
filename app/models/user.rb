class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "600x600>", thumb: "50x50>" }, default_url: "/images/:style/missing_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def admin?
    role == 'admin'
  end

  def photographer?
    role == 'photographer'
  end

  def name
    "#{first_name} #{last_name}"
  end
end
