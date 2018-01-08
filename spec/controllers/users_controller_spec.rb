require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = User.create!(first_name: "abc", last_name: "xyz", email: "abc@gmail.com", password: "123456")
  end

  describe 'GET #show' do

    context 'when user is logged in' do

      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end

    end

    context 'when user is logged out' do

      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end  
      
    end  

  end
end