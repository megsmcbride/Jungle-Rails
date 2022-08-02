require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do


    it 'should validate the password' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password => nil,
        :password_confirmation => 'password')

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate the password conformation' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => nil)

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate the first-name' do
      @user = User.new(
        :first_name => nil,
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate the last-name' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => nil,
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate the email' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => nil,
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate that the password and password conformation match' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'passingpassword')

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate that the password is more than 8 characters' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  '123',
        :password_confirmation => '123')

        @user.save
        expect(@user.errors.full_messages).to be_present
        expect(@user).not_to be_valid
    end

    it 'should validate that the email is unqiue' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save

        @user2 = User.new(
          :first_name => 'Megan',
          :last_name => 'McBride',
          :email => 'megan@gmail.com',
          :password =>  'password',
          :password_confirmation => 'password')


        @user2.save
        expect(@user2.errors.full_messages).to be_present
        expect(@user2).not_to be_valid
    end

    it 'should not be case sensitive' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'MEGan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        expect(@user).to be_valid

    end
  end 
  describe '.authenticate_with_credentials' do
    it 'should return a user if authentication is successful' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        @user = User.authenticate_with_credentials('megan@gmail.com', 'password')
        expect(@user).not_to be(nil)
    end

    it 'should authenticate and return a user with whitespaces surrounding email' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        @user = User.authenticate_with_credentials('megan@gmail.com', 'password')
        expect(@user).not_to be(nil)
    end

    it 'should not return a user if password authentication is unsuccessful' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        expect(User.authenticate_with_credentials('megan@gmail.com', 'password1')).to eq(nil)
    end

    it 'should not return a user if email authentication is unsuccessful' do
      @user = User.new(
        :first_name => 'Megan',
        :last_name => 'McBride',
        :email => 'megan@gmail.com',
        :password =>  'password',
        :password_confirmation => 'password')

        @user.save
        expect(User.authenticate_with_credentials('megan123@gmail.com', 'password')).to eq(nil)
    end
  end

end
