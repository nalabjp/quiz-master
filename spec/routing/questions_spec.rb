require 'rails_helper'

RSpec.describe 'Routes to questions controller', :type => :routing do
  describe "GET '/'" do
    it do
      expect(get: '/').to route_to(
        controller: 'questions',
        action: 'index'
      )
    end
  end

  describe "PATCH '/questions/1/answer'" do
    it do
      expect(patch: '/questions/1/answer').to route_to(
        controller: 'questions',
        action: 'answer',
        id: '1'
      )
    end
  end

  describe "POST '/questions'" do
    it do
      expect(post: '/questions').to route_to(
        controller: 'questions',
        action: 'create'
      )
    end
  end

  describe "GET '/questions/new'" do
    it do
      expect(get: '/questions/new').to route_to(
        controller: 'questions',
        action: 'new'
      )
    end
  end

  describe "GET '/questions/1/edit'" do
    it do
      expect(get: '/questions/1/edit').to route_to(
        controller: 'questions',
        action: 'edit',
        id: '1'
      )
    end
  end

  describe "GET '/questions/1'" do
    it do
      expect(get: '/questions/1').to route_to(
        controller: 'questions',
        action: 'show',
        id: '1'
      )
    end
  end

  describe "PATCH '/questions/1'" do
    it do
      expect(patch: '/questions/1').to route_to(
        controller: 'questions',
        action: 'update',
        id: '1'
      )
    end
  end

  describe "PUT '/questions/1'" do
    it do
      expect(put: '/questions/1').to route_to(
        controller: 'questions',
        action: 'update',
        id: '1'
      )
    end
  end

  describe "DELETE '/questions/1'" do
    it do
      expect(delete: '/questions/1').to route_to(
        controller: 'questions',
        action: 'destroy',
        id: '1'
      )
    end
  end

  describe "GET '/questions'" do
    it { expect(get: '/questions').not_to be_routable }
  end
end
