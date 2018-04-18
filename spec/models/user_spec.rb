require "rails_helper"

describe User, type: :model do
  it "should not validate users without an email address" do
    @user = FactoryBot.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end

  context "Testing Validations password is not 6 digit" do
    it "should not validate" do
      expect(User.new(email:"jmmig@gmail.com", password: "1234")).not_to be_valid
    end
  end
end
