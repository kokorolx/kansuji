RSpec.describe Kansuji do
  it "has a version number" do
    expect(Kansuji::VERSION).not_to be nil
  end

  describe "random" do
    context "mutual try" do
        1000000.times do |index|
          it "#{index} " do
          exp = rand(75)
          num = rand(10 ** exp)
          expect(num.to_kansuji.to_number).to eq(num)
        end
      end
    end
  end
end
