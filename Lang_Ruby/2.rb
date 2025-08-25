#!/usr/bin/env ruby

def calculate_even_fibonacci_numbers(n)
  result, second_to_last, last = 0, 1, 1
  current = second_to_last + last
  while current < n do
    if current.even? then
      result += current
    end
    second_to_last, last = last, current
    current = second_to_last + last
  end
  return result
end

if __FILE__ == $0
  puts calculate_even_fibonacci_numbers 4000000
end