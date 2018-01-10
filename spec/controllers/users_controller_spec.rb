require 'rails_helper'

describe UsersController, type: :controller do
  before do
    # @user_1 = User.create!(first_name: "abc", last_name: "xyz", email: "abc@gmail.com", password: "123456")
    # @user_2 = User.create!(first_name: "efg", last_name: "lmn", email: "xyz@gmail.com", password: "123456")
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)

  end

  describe 'GET #show' do

    context 'when user is logged in' do

      before do
        sign_in @user1
      end

      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end

      it 'other users profile restricted' do
        get :show, params: { id: @user2.id }
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when user is logged out' do

      before do
        sign_out @user1
      end
      
      it 'redirects to login' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(root_path)
      end  

    end  

  end
end