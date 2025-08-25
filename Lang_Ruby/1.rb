#!/usr/bin/env ruby

def calculate_sum_of_multiples(n)
  sumOfMultiples = 0
  i = n - 1
  while i > 0 do
    sumOfMultiples += i if (i % 3 == 0) || (i % 5 == 0)
    i -= 1
  end
  return sumOfMultiples
end

if __FILE__ == $0
  puts calculate_sum_of_multiples 1000
end