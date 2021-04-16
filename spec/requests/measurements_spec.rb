# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:measurements) { create_list(:measurement, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:measurement_id) { measurements.first.id }
  let(:headers) { valid_headers }

  describe 'GET /measurements' do
    before { get '/measurements', headers: headers }

    it 'returns measurements' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /measurements/:id
  describe 'GET /measurements/:id' do
    before { get "/measurements/#{measurement_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the measurement' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measurement_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:measurement_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measurement/)
      end
    end
  end

  describe 'POST /measurements' do
    let(:valid_attributes) do
      { measurement: { running: 1, reading: 3, coding: 5, movie: 7, project: 11, user_id: user_id } }.to_json
    end
    let(:invalid_attributes) { { measurement: { running: 1 } }.to_json }

    context 'when the request is valid' do
      before { post '/measurements', params: valid_attributes, headers: headers }

      it 'creates a measurement' do
        expect(json['coding']).to eq(5)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/measurements', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['reading']).to eq(["can't be blank"])
      end
    end
  end

  describe 'PUT /measurements/:id' do
    let(:valid_attributes) do
      { measurement: { running: 1, reading: 3, coding: 5, movie: 7, project: 11, user_id: user_id } }.to_json
    end

    context 'when the record exists' do
      before { put "/measurements/#{measurement_id}", params: valid_attributes, headers: headers }

      it 'returns the measurement' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measurement_id)
      end

      it 'returns the measurement with an edited name' do
        expect(json).not_to be_empty
        expect(json['project']).to eq(11)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /tasks/:id
  describe 'DELETE /measurements/:id' do
    before { delete "/measurements/#{measurement_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
