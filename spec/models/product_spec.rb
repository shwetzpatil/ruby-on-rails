require 'rails_helper'

describe Product do
  let(:product) {Product.create!(name: "lipstick") }
  let(:user1) {User.create!(first_name: "abc", last_name: "xyz", email: "abc@gmail.com", password: "123456")}
  
  before do
    product.comments.create!(rating: 1, user: user1, body: "Awful product!")
    product.comments.create!(rating: 3, user: user1, body: "Ok!")
    product.comments.create!(rating: 5, user: user1, body: "Great product!")
    product.orders.create!(total:60,user: user1, product: product)
    product.orders.create!(total:50,user: user1, product: product)
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq (3)
  end

  it "should test Validations" do
    expect(Product.new(description: "L,Oreals")).not_to be_valid
  end

  it "should return correct number of orders" do
    expect(product.orders.count).to eq 2
  end
end