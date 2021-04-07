require 'rails_helper'

RSpec.describe User, type: :model do

    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password_digest).is_at_least(6)}

    describe '#password=(password)' do
        let(:user1) { create(:user) }

        it 'password_digest should not be nil' do
            expect(user1.password_digest).to_not be nil
        end

        it 'sets @password value to input password' do
            expect(user1.password).to eq('password')
        end

    end

    describe '#is_password?(password)'


    describe '::find_by_credentials'


    describe '#ensure_session_token'


    describe '#reset_session_token!'


end