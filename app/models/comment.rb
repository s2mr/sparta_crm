class Comment < ApplicationRecord
  belongs_to :customer #自動生成されてる
  belongs_to :user
end
