require 'rails_helper'

RSpec.describe User, type: :model do
    subject(:user1) do
        FactoryBot.create(:user, 
        username: 'john', 
        password: 'password')
    end

    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}

    describe '#password=(password)' do

        it 'password_digest should not be nil' do
            expect(user1.password_digest).to_not be nil
        end

        it 'sets @password value to input password' do
            expect(user1.password).to eq('password')
        end

    end

    describe '#is_password?(password)' do

        context 'with correct password' do
            it 'return true' do
                expect(user1.is_password?('password')).to be true
            end
        end

        context 'with incorrect password' do
            it 'return false' do
                expect(user1.is_password?('password123')).to be false
            end
        end
    end


    describe '::find_by_credentials' do
        # subject(:user2) { User.create!(username: 'john', password: 'password') }
        # subject(:user) { FactoryBot.create(:user, username: 'john', password: 'password') }

        before { user1.save! }
        
        context 'with matching credentials' do
            it 'returns the matching user' do
                expect(User.find_by_credentials('john', 'password')).to eq(user1) 
            end
        end

        context 'without matching credentials' do
            it 'returns nil' do
                expect(User.find_by_credentials('john', 'psasword')).to be nil 
            end
        end
    end

    describe '#ensure_session_token' do

        it 'ensures user has a session token' do
            expect(user1.session_token).to_not be nil
        end

    end


    describe '#reset_session_token!' do

        it 'resets users session_token' do
            old_session_token = user1.session_token
            user1.reset_session_token!
            expect(old_session_token).to_not eq(user1.session_token)
        end

        it 'persists new token_session to the DB' do
            user1.reset_session_token!
            expect(user1).to eq(User.last)
        end

        it 'should return the new session_token' do
            expect(user1.reset_session_token!).to eq(user1.session_token)
        end
    end


end