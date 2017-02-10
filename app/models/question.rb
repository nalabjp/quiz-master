class Question < ApplicationRecord
  validates :content, presence: true
  validates :answer, presence:true

  def correct_answer?(input)
    Answer.new(answer).correct_with?(input)
  end
end
