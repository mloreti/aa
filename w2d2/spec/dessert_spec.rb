require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before do
      brownie.add_ingredient("sugar")
    end
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to eq(["sugar"])
    end
  end

  describe "#mix!" do
    before do
      brownie.add_ingredient("sugar")
      brownie.add_ingredient("water")
      brownie.mix!
    end
    let(:ingredients) { brownie.ingredients }
    it "shuffles the ingredient array" do
      expect(brownie.mix!).to_not eq(:ingredients)
    end
  end

  describe "#eat" do
    before do
      brownie.eat(1)
    end
    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(99)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(101)}.to raise_error(RuntimeError)
    end
  end
end
