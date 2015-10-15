class RSpecGreeter 
	def greet
		"Hello RSpec!"
	end
end

describe "RSpec Greeter" do
	it "shoud say 'Hello Rspec!' when it receives the greet() message" do
		greeter = RSpecGreeter.new
		greeting = greeter.greet
		expect(greeting).to eql "Hello RSpec!"
	end
end