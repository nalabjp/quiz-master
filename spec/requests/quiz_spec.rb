require 'rails_helper'

RSpec.describe 'Quiz', type: :request do
  before do
    q = Question.find_or_create_by(content: 'q1', answer: 'a1')
    @id = q.id
  end

  context 'Answer the question and correct' do
    it do
      get "/quiz/#{@id}"
      expect(response).to render_template(:show)

      patch "/quiz/#{@id}/answer", params: { question: { answer: 'a1' } }
      expect(response).to redirect_to(root_url)
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end

  context 'Answer the question, but incorrect' do
    it do
      get "/quiz/#{@id}"
      expect(response).to render_template(:show)

      patch "/quiz/#{@id}/answer", params: { question: { answer: 'a2' } }
      expect(response).to render_template(:show)
    end
  end
end
