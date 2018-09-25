class College < ApplicationRecord
  has_many :students, foreign_key: :user_id, class_name: "User"
end
