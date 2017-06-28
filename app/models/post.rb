class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    
    resourcify # (권한 설정하고자하는 모델에 선언)
    include Authority::Abilities
    belongs_to :user # 게시글은 유저 한 명의 것이니까 users가 아닌 user
    
    validates :title, presence: {message: "제목이 작성되지 않았습니다."}, length: {minimum: 2}
    validates :content, presence: {message: "내용이 작성되지 않았습니다."}
end
