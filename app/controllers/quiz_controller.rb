class QuizController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_question, only: [:show, :answer]

  def show
    @react_data = @question.as_json(only: :content).merge(url: answer_quiz_url(@question))
  end

  # PATCH /questions/1/answer
  def answer
    if @question.correct_answer?(answer_params[:answer])
      render json: { result: 'correct', message: 'Congrats! Your answer is correct!' }
    else
      render json: { result: 'incorrect', message: 'Oooops, incorrect... orz' }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def answer_params
      params.require(:question).permit(:answer)
    end
end
