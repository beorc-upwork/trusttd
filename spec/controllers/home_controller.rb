require 'rails_helper'

RSpec.shared_examples 'show page' do |request_block|
  describe 'GET show' do
    it 'should return status 200' do
      get :show
      response.should have_http_status(:ok)
    end
  end
end

RSpec.describe HomeController, type: :controller do
  context 'given no notifications' do
    include_examples 'show page'
  end

  context 'given some notifications' do
    fixtures :notifications

    it 'should have any notifications' do
      expect(Notification.count).to eq 1
    end

    include_examples 'show page'
  end
end
