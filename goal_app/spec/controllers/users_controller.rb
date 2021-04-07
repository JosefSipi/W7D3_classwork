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

    describe 'get#new'

    describe 'post#create'

    describe 'get#edit'

    describe 'patch#update'

    describe 'delet#destroy'
    


end