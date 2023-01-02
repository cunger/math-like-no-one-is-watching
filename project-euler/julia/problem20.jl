function sum_of_digits(n)
  chars = collect(string(n))
  ints = map(c -> parse(Int64, c), chars)
  return sum(ints)
end

big(100) |>
factorial |>
sum_of_digits |>
println
