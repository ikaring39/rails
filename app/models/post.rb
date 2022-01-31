class Post < ApplicationRecord
    # 英数字のみ登録可能にする
    VALID_ID_REGEX = /\A[\w+\-.]/i
    validates :uuid, presence: true, format: { with: VALID_ID_REGEX }
    validates :content, presence: true, format: { with: VALID_ID_REGEX }
end
