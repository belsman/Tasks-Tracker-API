# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:tasks) { create_list(:task, 5) }
  let(:task_id) { tasks.first.id }

  let(:headers) { valid_headers }

  describe 'GET /tasks' do
    before { get '/tasks', params: {}, headers: headers }

    it 'returns tasks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
