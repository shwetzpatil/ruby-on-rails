require 'rails_helper'

describe Product do
  let(:product) {Product.create!(name: "lipstick") }
  let(:user) {User.create!(first_name: "abc", last_name: "xyz", email: "abc@gmail.com", password: "123456")}
  
  before do
    product.comments.create!(rating: 1, user: user, body: "Awful product!")
    product.comments.create!(rating: 3, user: user, body: "Ok!")
    product.comments.create!(rating: 5, user: user, body: "Great product!")
  end

  it "returns the average rating of all comments" do
  end

  it "Testing Validations" do
    expect(Product.new(description: "L,Oreals")).not_to be_valid
  end
  
end