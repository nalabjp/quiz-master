class Question < ApplicationRecord
  validates :content, presence: true
  validates :answer, presence:true
end
