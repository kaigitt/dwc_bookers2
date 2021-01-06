class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  # ユーザーをフォローする
def follow(user_id)
  follower.create(followed_id: user_id)
end

# ユーザーのフォローを外す
def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
end

# フォローしていればtrueを返す
def following?(user)
  following_user.include?(user)
end


    def User.search(search, user_or_post, how_search)
        if user_or_post == "1"
            if how_search == "1"
                    User.where(['name LIKE ?', "%#{search}%"])
            elsif how_search == "2"
                    User.where(['name LIKE ?', "%#{search}"])
            elsif how_search == "3"
                    User.where(['name LIKE ?', "#{search}%"])
            elsif how_search == "4"
                    User.where(['name LIKE ?', "#{search}"])
            else
                    User.all
            end
         end
    end

  include JpPrefecture
jp_prefecture :prefecture_code

def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
end

def prefecture_name=(prefecture_name)
  self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
end
end