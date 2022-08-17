class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  has_many :messages

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
       data = access_token.info
       user = User.where(email: data['email']).first
   
       # Uncomment the section below if you want users to be created if they don't exist
       unless user
           user = User.create(
              email: data['email'],
              password: Devise.friendly_token[0,20],
           )
          
           return { user: user, new_user: true }
       end
      { user: user, new_user: false }
     end
 
 
end