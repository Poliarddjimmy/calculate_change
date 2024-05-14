# Calculate Change

This Ruby script calculates the change to be given for a transaction. Given the cost and payment amount, it returns an array of quantities for each denomination in the following order:

[<# of 100s>, <# of 50s>, <# of 20s>, <# of 10s>, <# of 5s>, <# of 1s>, <# of quarters (0.25)>, <# of dimes (0.10)>, <# of nickels (0.05)>, <# of pennies (0.01)>]

## Function Definition

The `calculate_change` function is defined as follows:

```ruby
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
```

## Example Usage
Here are some examples of how to use the `calculate_change` function:

```ruby
puts calculate_change(75.36, 100)  # Output: [0, 0, 1, 2, 0, 4, 2, 1, 0, 4]
puts calculate_change(19.99, 50)   # Output: [0, 0, 1, 1, 1, 0, 0, 0, 0, 1]
puts calculate_change(123.44, 300) # Output: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
puts calculate_change(0, 1)        # Output: [0, 0, 0, 0, 0, 1, 0, 0, 0, 0]
puts calculate_change(4.99, 5)     # Output: [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
```

## Testing
Setting Up RSpec
First, ensure you have RSpec installed. You can install it by running:

```bash
gem install rspec
```

### Running the Tests
Navigate to the root directory of your project and run the tests using:
```bash
rspec
```
#### Test Cases
The test cases for the `calculate_change` function are defined in `spec/calculate_change_spec.rb`:

```ruby
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
```


# Function Overview
The `calculate_change` function calculates the change to be given back to a customer after a purchase. It takes two arguments:

cost: The cost of the item purchased.
payment: The amount of money given by the customer.
The function returns an array that represents the count of each denomination needed to make up the change.

Detailed Breakdown
1. Calculate Initial Change
    ```ruby
    change = ((payment - cost) * 100).round
    payment - cost: Subtracts the cost from the payment to determine the change due.
    * 100: Converts the change from dollars to cents (since the denominations are in cents).
    .round: Rounds the result to the nearest whole number to handle any floating-point precision issues.
    ```
2. Define Denominations
    ```ruby
    denominations = [10000, 5000, 2000, 1000, 500, 100, 25, 10, 5, 1]
    This array represents the denominations in cents: $100, $50, $20, $10, $5, $1, 25¢, 10¢, 5¢, and 1¢.
    ```
3. Initialize Change Array
    ```ruby
    change_array = []
    An empty array to store the count of each denomination needed for the change.
    ```
4. Calculate Count of Each Denomination
    ```ruby
    denominations.each do |denomination|
      count = change / denomination
      change_array << count
      change -= count * denomination
    end
    ```
`denominations.each do |denomination|`: Iterates over each denomination.
`count = change / denomination`: Calculates how many of the current denomination fit into the remaining change.
`change_array << count`: Adds the count to the change_array.
`change -= count * denomination`: Subtracts the value of the counted denominations from the remaining change.

#### Example
Let's go through an example to see how it works.

Cost: $23.65
Payment: $100.00
Step-by-Step Calculation:

#### Calculate the change in cents:

```ruby
change = ((100.00 - 23.65) * 100).round
# change = (76.35 * 100).round
# change = 7635
```
#### Initialize denominations and change_array:

```ruby
denominations = [10000, 5000, 2000, 1000, 500, 100, 25, 10, 5, 1]
change_array = []
```
#### Iterate through each denomination and calculate the count:

```ruby
count = 7635 / 10000   # count = 0
change_array << 0      # change_array = [0]
change -= 0 * 10000    # change = 7635

count = 7635 / 5000    # count = 1
change_array << 1      # change_array = [0, 1]
change -= 1 * 5000     # change = 2635

count = 2635 / 2000    # count = 1
change_array << 1      # change_array = [0, 1, 1]
change -= 1 * 2000     # change = 635

count = 635 / 1000     # count = 0
change_array << 0      # change_array = [0, 1, 1, 0]
change -= 0 * 1000     # change = 635

count = 635 / 500      # count = 1
change_array << 1      # change_array = [0, 1, 1, 0, 1]
change -= 1 * 500      # change = 135

count = 135 / 100      # count = 1
change_array << 1      # change_array = [0, 1, 1, 0, 1, 1]
change -= 1 * 100      # change = 35

count = 35 / 25        # count = 1
change_array << 1      # change_array = [0, 1, 1, 0, 1, 1, 1]
change -= 1 * 25       # change = 10

count = 10 / 10        # count = 1
change_array << 1      # change_array = [0, 1, 1, 0, 1, 1, 1, 1]
change -= 1 * 10       # change = 0

count = 0 / 5          # count = 0
change_array << 0      # change_array = [0, 1, 1, 0, 1, 1, 1, 1, 0]
change -= 0 * 5        # change = 0

count = 0 / 1          # count = 0
change_array << 0      # change_array = [0, 1, 1, 0, 1, 1, 1, 1, 0, 0]
change -= 0 * 1        # change = 0
```

#### Final Output
```ruby
change_array = [0, 1, 1, 0, 1, 1, 1, 1, 0, 0]
```

#### This array means:
0 bills of $100
1 bill of $50
1 bill of $20
0 bills of $10
1 bill of $5
1 bill of $1
1 quarter (25¢)
1 dime (10¢)
0 nickels (5¢)
0 pennies (1¢)
So, the change for $76.35 is given as 1 x $50 bill, 1 x $20 bill, 1 x $5 bill, 1 x $1 bill, 1 x 25¢, and 1 x 10¢.