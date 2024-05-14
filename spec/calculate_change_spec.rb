require_relative '../calculate_change'

RSpec.describe '#calculate_change' do
  it 'calculates correct change for 75.36 cost with 100 payment' do
    expect(calculate_change(75.36, 100)).to eq([0, 0, 1, 0, 0, 4, 2, 1, 0, 4])
  end

  it 'calculates correct change for 19.99 cost with 50 payment' do
    expect(calculate_change(19.99, 50)).to eq([0, 0, 1, 1, 0, 0, 0, 0, 0, 1])
  end

  it 'calculates correct change for 123.44 cost with 300 payment' do
    expect(calculate_change(123.44, 300)).to eq([1, 1, 1, 0, 1, 1, 2, 0, 1, 1])
  end

  it 'calculates correct change for 0 cost with 1 payment' do
    expect(calculate_change(0, 1)).to eq([0, 0, 0, 0, 0, 1, 0, 0, 0, 0])
  end

  it 'calculates correct change for 4.99 cost with 5 payment' do
    expect(calculate_change(4.99, 5)).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 1])
  end
end
