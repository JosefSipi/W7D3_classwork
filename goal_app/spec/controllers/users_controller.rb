require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'get#index' do
        it "renders users index" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe 'get#show' do
        let(:user) { create(:user) }
        context 'with valid params' do
            it 'redirects to users show page' do
                get :show, params: { id: user.id }
                expect(response).to redirect_to(user_url(User.last))
            end
        end
    end

    describe 'get#new' do
        it 'renders the new user page' do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'post#create' do

        context 'with valid params'

        context 'with invalid params' do
            let(:user) { create(:user) }
            it 'should render the users new (signup) page' do
                post :create, params: { user: {username: ""}}
                expect(response).to render_template(:new)
            end
        end

    end

    describe 'get#edit'

    describe 'patch#update'

    describe 'delet#destroy'
    


end