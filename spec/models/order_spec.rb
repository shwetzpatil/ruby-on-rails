require 'rails_helper'

describe Order do
  let(:product1) {Product.create!(name: "lipstick") }
  let(:product2) {Product.create!(name: "nailpaint") }

  let(:user1) {User.create!(first_name: "abc", last_name: "xyz", email: "abc@gmail.com", password: "123456")}
  let(:order1) {Order.create!(total:50,user: user1, product: product1)}
  let(:order2) {Order.create!(total:60,user: user1, product: product2)}

  it "should return correct order total" do
    expect(order1.total).to eq (50)
  end
  
end