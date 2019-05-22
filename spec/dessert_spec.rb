require 'rspec'
require 'dessert'
require "chef"

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  
  let(:chef) { double("chef") }
  subject(:cheesecake) {Dessert.new("cheesecake", 5, chef)}
  
  describe "#initialize" do
    it "sets a type" do
      expect(cheesecake.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(cheesecake.quantity).to eq(5)
    end
  end
    it "starts ingredients as an empty array" do
      expect(cheesecake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cheesecake", "Fifty", chef)}.to raise_error(ArgumentError)
    end
  end
    
  describe "#add_ingredient" do
  
    it "adds an ingredient to the ingredients array" do
      expect(cheesecake.ingredients[0]).to eq("Cream Cheese")
    end
  
  describe "#mix!" do
    before(:each) do
      cheesecake.add_ingredient("Milk")
      cheesecake.add_ingredient("Butter")
      cheesecake.add_ingredient("Cream Cheese")
      unshuffled = cheesecake.ingredients.dup
      unshuffled << "Strawberries"
      cheesecake.add_ingredient("Strawberries").mix!
    end
    it "shuffles the ingredient array" do
      expect(cheesecake.ingredients).to_not eq(unshuffled)
    end
    
    end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 

    end
    
      
    

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
