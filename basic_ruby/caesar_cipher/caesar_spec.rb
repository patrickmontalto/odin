require "./caesar"

describe "caesar cipher method" do
	it "shifts letter to the left n times" do
		expect(caesar_cipher("b",1)).to eql "a"
	end

	it "shifts a word to the left n times" do
		expect(caesar_cipher("dude", 1)).to eql "ctcd"
	end

	it "preserves white space" do
		expect(caesar_cipher("hi mom ",1)).to eql "gh lnl "
	end

	it "wraps arround alphabet" do
		expect(caesar_cipher("aaa", 1)).to eql "zzz"
	end

	it "accounts for capitalization" do
		expect(caesar_cipher("Hey Bro",1)).to eql "Gdx Aqn"
	end

	it "accounts for symbols" do
		expect(caesar_cipher("hey, mom",1)).to eql "gdx, lnl"
	end
end