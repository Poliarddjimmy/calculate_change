def calculate_change(cost, payment)
  change = ((payment - cost) * 100).round  # Convert dollars to cents
  denominations = [10000, 5000, 2000, 1000, 500, 100, 25, 10, 5, 1]
  change_array = []

  denominations.each do |denomination|
    count = change / denomination
    change_array << count
    change -= count * denomination
  end

  change_array
end

print calculate_change(123.44, 300) # => [0, 0, 1, 0, 0, 4, 2, 1, 0, 4]
