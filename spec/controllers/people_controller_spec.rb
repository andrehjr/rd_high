require "spec_helper"

describe PeopleController do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    let(:basic_auth) { { url: 'http://andrehjr.highrise.com', api_key: '1234' } }

    context 'Invalid credentials' do
      it "create a person" do
        expect {
          post :create, basic_auth.merge(person: { title: '' })
        }.to raise_error(RdHighriseApi::ConnectionError)
      end
    end

    context 'Valid people' do
      let(:valid_params) { { title: 'Test title', first_name: 'André', last_name: 'Jr' } }
      let(:success_response) { { status: 201 } }

      before do
        expect_any_instance_of(RdHighriseApi::People).to receive(:create).and_return(success_response)
        expect_any_instance_of(RdHighriseApi::People).to receive(:all).and_return([ valid_params])
      end

      it "create a person" do
        post :create, basic_auth.merge(person: valid_params)
        expect(assigns[:people]).to_not be_empty
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'Valid people' do
      let(:invalid_params) { { title: 'Test title' } }
      let(:failed_response) { { status: 422, messages: [ 'invalid'] } }

      before do
        expect_any_instance_of(RdHighriseApi::People).to receive(:create).and_return(failed_response)
      end

      it "doesn't create a person" do
        post :create, basic_auth.merge(person: invalid_params)
        expect(assigns[:people]).to be_nil
        expect(subject).to render_template(:new)
      end
    end
  end
end