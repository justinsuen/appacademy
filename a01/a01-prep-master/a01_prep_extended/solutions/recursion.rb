require "yaml"
class RecursionMachine
  def fibs_sum(n)
    return 0 if n == 0
    return 1 if n == 1

    fibs_sum(n-1) + fibs_sum(n-2) + 1
  end

  def subsets(arr)
    return [[]] if arr.empty?

    subs = subsets(arr[0..-2])
    subs.concat(subs.map{|el| el += [arr.last]})
  end

  def first_even_numbers_sum(n)
    return 2 if n == 1

    2 * n + first_even_numbers_sum(n-1)
  end

  def exponent(b, n)
    return 1 if n == 0

    if n > 0
      b * exponent(b, n - 1)
    else
      1.0/b * exponent(b, n + 1)
    end
  end

  def make_better_change(value, coins)
    coins_to_check = coins.select{|coin| coin <= value}
    return nil if coins_to_check.empty?

    solutions = []

    coins_to_check.sort.reverse.each do |coin|
      remainder = value - coin

      if remainder > 0
        remainder_solution = make_better_change(remainder, coins_to_check)
        solutions << [coin] + remainder_solution unless remainder_solution.nil?
      else
        solutions << [coin]
      end
    end

    solutions.sort_by!{|arr| arr.size}.first
  end

  def deep_dup(arr)
    arr.map{|el| el.is_a?(Array) ? deep_dup(el) : el}
  end

  def string_include_key?(string, key)
    return true if key.length == 0

    next_key_char = key.chars.first
    key_index = string.index(next_key_char)

    return false if key_index.nil?
    string_include_key?(string[key_index+1..-1], key[1..-1])
  end

  def prime_factorization(num)
    return [] if num == 1

    (2..Math.sqrt(num).ceil).each do |i|
      if num % i == 0
        return [i] + prime_factorization(num/i)
      end
    end

    return [num]
  end

  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 10, sum the digits of the resulting number.
  # Keep repeating until there is only one digit in the result, called the
  # "digital root". **Do not use string conversion within your method.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.

  def digital_root(num)
    digits = []

    while num > 0
      digits << num % 10
      num /= 10
    end

    digit_sum = digits.inject(&:+)

    digit_sum > 10 ? digital_root(digit_sum) : digit_sum
  end

  def base_converter(num, b)
    return "" if num == 0

    digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
    base_converter(num/b, b) + digits[num % b]
  end

  def eight_queens_possibilities(row_num, taken_columns, positions)
    positions ||= []
    return [positions] if row_num == 8

    all_positions = []
    columns_left = (0..7).to_a - taken_columns

    columns_left.each do |col|
      positions_dup = positions.dup
      positions_dup << [row_num, col]

      all_positions += eight_queens_possibilities(row_num + 1,
        taken_columns + [col], positions_dup)
    end

    all_positions
  end

end
