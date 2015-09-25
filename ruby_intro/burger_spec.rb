class Burger
	attr_reader :options

	def initialize(options={})
		@options = options
	end

	def apply_ketchup
		@ketchup = @options[:ketchup]
	end

	def has_ketchup_on_it?
		@ketchup
	end
end

describe Burger do
  describe "#apply_ketchup" do
  	subject { burger }
  	before  { burger.apply_ketchup }

    context "with ketchup" do
      let(:burger) { Burger.new(:ketchup => true) }
      
      specify { subject.has_ketchup_on_it?.should be_truthy }
    end
 
    context "without ketchup" do
      let(:burger) { Burger.new(:ketchup => false) }

      specify { subject.has_ketchup_on_it?.should be_falsey }
    end
  end
end