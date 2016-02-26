require 'spec_helper'

describe Bistro do
	let(:bistro) { Bistro.new("./test_menu.txt")}
  it 'has a menu object' do
    expect(bistro.menu).to be_a(Menu)
  end

  it 'has a total amount to spend, which is a float' do
    expect(bistro.total_amount).to eq(15.05)
  end
end