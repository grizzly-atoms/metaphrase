require 'rails_helper'

describe 'Translations API', type: :request do
  # initialize test data
  let!(:translations) { create_list(:translation, 10) }
  let(:translation_id) { translations.first.id }
  let(:copy) { "Travel is fatal to prejudice, bigotry, and narrow-mindedness, and many of our people need it sorely on these accounts. Broad, wholesome, charitable views of men and things cannot be acquired by vegetating in one little corner of the earth all one's lifetime." }

  # Test suite for GET /translations
  describe 'GET /translations' do
    # make HTTP get request before each example
    before { get '/translations' }

    it 'returns translations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /translations/:id
  describe 'GET /translations/:id' do
    before { get "/translations/#{translation_id}" }

    context 'when the record exists' do
      it 'returns the translation' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(translation_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:translation_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Translation with 'id'=#{translation_id}/)
      end
    end
  end

  # Test suite for POST /translations
  describe 'POST /translations' do
    # valid payload
    let(:valid_attributes) {
      { original_copy: copy,
        code: 'en-us',
        translated_copy: copy,
        application_domain: 'default'
      }
    }

    context 'when the request is valid' do
      before { post '/translations', params: valid_attributes }

      it 'creates a translation' do
        expect(json['original_copy']).to eq(copy)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/translations', params: { foo: 'bar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Original copy can't be blank, Code can't be blank, Translated copy can't be blank/)
      end
    end
  end

  # Test suite for PUT /translations/:id
  describe 'PUT /translations/:id' do
    let(:valid_attributes) { { translated_copy: 'Travel makes you a better person' } }

    context 'when the record exists' do
      before { put "/translations/#{translation_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /translations/:id
  describe 'DELETE /translations/:id' do
    before { delete "/translations/#{translation_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end