require 'spec_helper'

describe SetCombos do
  let(:bistro) { Bistro.new("./test_menu.txt")}
	let(:item1) { MenuItem.new("soup", "$1.00") }
	let(:item2) { MenuItem.new("burger", "$4.50") }
	let(:item3) { MenuItem.new("pie", "$2.40") }

	let(:combo1) { SetCombos::Combo.new([item1, item2, item3])}
  
  it 'has a version number' do
    expect(SetCombos::VERSION).not_to be nil
  end

  it 'calculates available combinations for a set and stores them as combo objects' do
    expect(bistro.find_valid_combo(6.90, combo1.combo, [])).to be_a(SetCombos::Combo)
    expect(bistro.find_valid_combo(6.90, combo1.combo, []).combo.length).to eq(2)
  end

  describe SetCombos::Combo do
  	let(:valid_combo2) { SetCombos::Combo.new([item2, item3, item1])}
  	let(:invalid_combo2) { SetCombos::Combo.new([item2, item3, item2, item1])}
  	random_number = rand(0..2)

  	it 'has an array of item objects' do
  		expect(combo1.combo[random_number]).to be_a(MenuItem)
  	end

    describe "get_sum method" do
      it 'returns the sum of a combos items prices' do
        expect(bistro.get_sum(combo1.combo)).to eq(7.90)
      end
    end

  	describe "same? method" do
	  	it 'returns true if it is the same as another combo based on content, ignoring order' do
	  		expect(combo1.same?(valid_combo2)).to be true
	  	end

	  	it 'returns false if it is not the same as another combo based on content, ignoring order' do
	  		expect(combo1.same?(invalid_combo2)).to be false
	  	end
	  end

  	describe "sums_to_total? method" do
	  	it 'returns true if the sum of the combo sums to a given total' do
	  		expect(combo1.sums_to_total?(7.90)).to be true
	  	end

	  	it 'returns false if the sum of the combo does not sum to a given total' do
	  		expect(combo1.sums_to_total?(8.00)).to be false
	  	end
	  end
  end

  
end

