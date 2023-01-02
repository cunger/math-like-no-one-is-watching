function length_collatz_sequence(n::Int64)
  length = 1

  while n != 1
    length += 1
    n = n%2 == 0 ? div(n,2) : (3*n + 1)
  end

  return length
end

let
  max_length = 1
  max_n = 1

  for n in 1:1_000_000
    length = length_collatz_sequence(n)

    if length > max_length
      max_length = length
      max_n = n
    end
  end

  println(max_n)
end
