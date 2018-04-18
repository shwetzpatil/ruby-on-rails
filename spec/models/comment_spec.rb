require 'rails_helper'

context "when comment is created" do
  describe Comment do
    let(:product1) {Product.create!(name: "lipstick") }
    let(:product2) {Product.create!(name: "lipstick") }
    let(:user1) {User.create!(first_name: "abc", last_name: "xyz", email: "abc@gmail.com", password: "123456")}
    let(:user2) {User.create!(first_name: "lmn", last_name: "mnp", email: "xyz@gmail.com", password: "654321")}
    let(:comment1) { Comment.create!(body: "classic", rating: 3, user: user1, product: product1) }
    let(:comment2) { Comment.create!(body: "classic", rating: 3, user: user2, product: product2) }

    # before do
    #   product.comments.push(comment)
    #   user.comments.push(comment)
    # end

    it "should validate a valid object" do
      expect(Comment.new(body: "classic")).not_to be_valid
      expect(Comment.new(body: "classic", rating:5)).not_to be_valid
      expect(comment1).to be_valid
    end

    it "should show correct product" do
      expect(comment1.product).not_to eq product2
      expect(comment1.product).to eq product1
    end

    it "shoud show correct user" do
      expect(comment1.user).not_to eq user2
      expect(comment1.user).to eq user1
    end
  end
end