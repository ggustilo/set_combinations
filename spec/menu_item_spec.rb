require 'spec_helper'

describe MenuItem do
	let(:valid_item) { MenuItem.new("carrot soup", "$5.45") }
  let(:invalid_item_by_name) { MenuItem.new(1234, "$5.45") }
  let(:invalid_item_by_price) { MenuItem.new("blackberry pie", "50000045") }

  it 'validates a valid item by name' do
    expect(valid_item.name).to eq("carrot soup")
  end

  it 'does not validate an invalid item by name' do
    expect{invalid_item_by_name}.to raise_error(RuntimeError, "That is not a valid name.")
  end

  it 'validates a valid item by price' do
    expect(valid_item.price).to eq("$5.45")
  end

  it 'does not validate an invalid item by price' do
    expect{invalid_item_by_price}.to raise_error(RuntimeError, "That is not a valid price.")
  end

  it 'can return a price as a float' do
    expect(valid_item.price_as_float).to eq(5.45)
  end

  it 'can return a price as an int' do
    expect(valid_item.price_as_int).to eq(5)
  end

  it 'can return a price without a decimal' do
    expect(valid_item.price_without_decimal).to eq(545)
  end
end