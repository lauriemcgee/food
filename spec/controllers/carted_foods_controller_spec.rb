require('rails_helper')

RSpec.describe CartedFoodsController, type: :controller do
  describe "POST action" do
    it "should store carted food information hash in session if user is not logged in" do
        @food_item = FoodItem.create(
          name: 'food',
          price: 3.2
        )
        post(:create, {:quantity => 2, :food_item_id => @food_item.id,})
        puts session.inspect
        expect(session[:carted_food_info]).to eq(
          {
            :quantity => 2, 
            :food_item_id => @food_item.id,
            :status => 'carted'
            })
    end
  end
end