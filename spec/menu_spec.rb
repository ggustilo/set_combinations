require 'spec_helper'

describe Menu do
	let(:valid_items) { [MenuItem.new("soup", "$1.00"), MenuItem.new("burger", "$4.50"), MenuItem.new("pie", "$2.40")] }
	let(:valid_menu) {Menu.new(valid_items)}

	let(:invalid_items) { [1505, MenuItem.new("burger", "$4.50"), MenuItem.new("pie", "$2.40")] }
	let(:invalid_menu) {Menu.new(invalid_items)}
	random_number = rand(0..2)

  it 'accepts valid menu items' do
    expect(valid_menu.items[random_number]).to be_a(MenuItem)
    expect(valid_menu.items.length).to eq(3)
  end

  it 'does not accept invalid items and raises an error' do
  	expect(STDOUT).to receive(:puts).with("One of your items was invalid.  It was not included.  Please check for errors next time.")
    expect(invalid_menu.items.length).to eq(2)
  end
end