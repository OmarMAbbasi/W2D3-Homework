require 'rspec'
require 'dessert'
require "chef"

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  
  let(:chef) { double("chef", :name => "Ryan") }
  subject(:cheesecake) {Dessert.new("cheesecake", 5, chef)}
  
  describe "#initialize" do
    it "sets a type" do
      expect(cheesecake.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(cheesecake.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cheesecake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cheesecake", "Fifty", chef)}.to raise_error(ArgumentError)
    end
  end
    
  describe "#add_ingredient" do
    before(:each) do
      cheesecake.add_ingredient("Cream Cheese")
    end
  
    it "adds an ingredient to the ingredients array" do
      expect(cheesecake.ingredients[0]).to eq("Cream Cheese")
    end
  end
  
  describe "#mix!" do
  let(:unshuffled) {["Milk", "Butter", "Cream Cheese", "Strawberries"]}
    before(:each) do
      cheesecake.add_ingredient("Milk")
      cheesecake.add_ingredient("Butter")
      cheesecake.add_ingredient("Cream Cheese")
      unshuffled = cheesecake.ingredients.dup
      unshuffled << "Strawberries"
      cheesecake.add_ingredient("Strawberries")
    end
    it "shuffles the ingredient array" do
      expect(cheesecake.mix!).to_not eq(unshuffled)
    end
  end

  describe "#eat" do
  before(:each) do 
    cheesecake.eat(2)
  end
    it "subtracts an amount from the quantity" do 
      expect(cheesecake.quantity).to eq(3)

    end 

    it "raises an error if the amount is greater than the quantity" do
      expect do 
        cheesecake.eat(10)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
  it "contains the titleized version of the chef's name" do 
      expect(chef).to receive(:titleize)
      cheesecake.serve
      end
    end

  describe "#make_more" do
  it "calls bake on the dessert's chef with the dessert passed in" do
    expect(chef).to receive(:bake).with(cheesecake).and_return(:heat!)
    cheesecake.make_more
  end





  end
end
