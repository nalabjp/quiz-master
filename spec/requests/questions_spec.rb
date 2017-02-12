require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  before do
    q = Question.find_or_create_by(content: 'q1', answer: 'a1')
    @id = q.id
  end

  context 'Create a question and redirect to root_url' do
    it do
      get '/questions/new'
      expect(response).to render_template(:new)

      post '/questions', params: { question: { content: 'qestion!', answer: 'answer!' } }
      expect(response).to redirect_to(root_url)
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end

  context 'Create a question, but incomplete' do
    it do
      get '/questions/new'
      expect(response).to render_template(:new)

      post '/questions', params: { question: { content: '', answer: '' } }
      expect(response).to render_template(:new)
    end
  end

  context 'Update a question and redirect to root_url' do
    it do
      get "/questions/#{@id}/edit"
      expect(response).to render_template(:edit)

      patch "/questions/#{@id}", params: { question: { content: 'u_q1', answer: 'u_a1' } }
      expect(response).to redirect_to(root_url)
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end

  context 'Update a question, but incomplete' do
    it do
      get "/questions/#{@id}/edit"
      expect(response).to render_template(:edit)

      patch "/questions/#{@id}", params: { question: { content: '', answer: '' } }
      expect(response).to render_template(:edit)
    end
  end

  context 'Delete a question and redirect to root_url' do
    it do
      get '/'
      expect(response).to render_template(:index)

      delete "/questions/#{@id}"
      expect(response).to redirect_to(root_url)
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end
end
