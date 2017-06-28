class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  include Authority::UserAbilities
  has_many :posts, dependent: :destroy

  after_create :assign_default_role, if: Proc.new { User.count > 1 }
  
  
  private
  def assign_default_role
    add_role :user
  end
  
end
