require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'Validations' do

    it 'should create a user with all fields' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'hello',
        password_confirmation: 'hello'
      )
      expect(user).to (be_valid)
    end

    it 'should be invalid without email' do
      user = User.create(
        name: 'Bob',
        email: nil,
        password: 'hello',
        password_confirmation: 'hello'
      )
      expect(user).to_not (be_valid)
    end

    it 'should be invalid without password' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: nil,
        password_confirmation: 'hello'
      )
      expect(user).to_not (be_valid)
    end

    it 'should be invalid with a password less than 5 characters' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'helo',
        password_confirmation: 'helo'
      )
      expect(user).to_not (be_valid)
    end

    it 'should be invalid with mismatching password' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'adele',
        password_confirmation: 'hello'
      )
      expect(user).to_not (be_valid)
    end

    it 'should be invalid without password confirmation' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'adele',
        password_confirmation: nil
      )
      expect(user).to_not (be_valid)
    end

    it 'should be invalid with existing email' do
      user1 = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'adele',
        password_confirmation: 'adele'
      )
      user2 = User.create(
        name: 'Bob2',
        email: 'bob@bob.bob',
        password: 'adele',
        password_confirmation: 'adele'
      )
      expect(user2).to_not (be_valid)
    end
  end


  describe '.authenticate_with_credentials' do

    it 'should authenticate a user' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'hello',
        password_confirmation: 'hello'
      )
      expect(User.authenticate_with_credentials(user.email, user.password)).to eq(user)
    end 

    it 'should authenticate a with extra space in email' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'hello',
        password_confirmation: 'hello'
      )
      spaced_email = '  bob@bob.bob      '
      expect(User.authenticate_with_credentials(spaced_email, user.password)).to eq(user)
    end 

    it 'should authenticate a with wrong casing in email' do
      user = User.create(
        name: 'Bob',
        email: 'bob@bob.bob',
        password: 'hello',
        password_confirmation: 'hello'
      )
      cased_email = 'bOb@bOb.bOb'
      expect(User.authenticate_with_credentials(cased_email, user.password)).to eq(user)
    end 


  end


end
