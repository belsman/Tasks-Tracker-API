# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  # initialize test data
  let!(:tasks) { create_list(:task, 5) }
  let(:task_id) { tasks.first.id }

  describe 'GET /tasks' do
    before { get '/tasks' }

    it 'returns tasks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /tasks/:id
  describe 'GET /tasks/:id' do
    before { get "/tasks/#{task_id}" }

    context 'when the record exists' do
      it 'returns the task' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(task_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:task_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  # Test suite for POST /tasks
  describe 'POST /tasks' do
    # valid payload
    let(:valid_attributes) do
      { task: { name: 'Running', description: 'Lorem stuffs goes here', measurement_unit: 'km', daily_target: 1 } }
    end
    let(:invalid_attributes) { { task: { name: 'Running' } } }

    context 'when the request is valid' do
      before { post '/tasks', params: valid_attributes }

      it 'creates a task' do
        expect(json['name']).to eq('Running')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/tasks', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['daily_target']).to eq(["can't be blank"])
      end
    end
  end

  # Test suite for PATCH /tasks/:id
  describe 'PUT /tasks/:id' do
    let(:valid_attributes) do
      { task: { name: 'Running X', description: 'Lorem stuffs goes here', measurement_unit: 'km', daily_target: 1 } }
    end

    context 'when the record exists' do
      before { put "/tasks/#{task_id}", params: valid_attributes }

      it 'returns the task' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(task_id)
      end

      it 'returns the task with an edited name' do
        expect(json).not_to be_empty
        expect(json['name']).to eq('Running X')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /tasks/:id
  describe 'DELETE /tasks/:id' do
    before { delete "/tasks/#{task_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
