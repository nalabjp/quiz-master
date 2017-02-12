require 'rails_helper'

RSpec.describe 'Routes to quiz controller', :type => :routing do
  describe "GET '/quiz/1'" do
    it do
      expect(get: '/quiz/1').to route_to(
        controller: 'quiz',
        action: 'show',
        id: '1'
      )
    end
  end

  describe "PATCH '/quiz/1/answer'" do
    it do
      expect(patch: '/quiz/1/answer').to route_to(
        controller: 'quiz',
        action: 'answer',
        id: '1'
      )
    end
  end
end
