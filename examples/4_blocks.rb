def blocks
  foo = lambda { |input| input }.call('bar')

  numbers = [1, 2, 3, 4, 5]
  numbers.each do |n|
    foo = n
  end

  hash = {
    a: foo,
    b: numbers.inject { |sum, n| sum + n }
  }
end
