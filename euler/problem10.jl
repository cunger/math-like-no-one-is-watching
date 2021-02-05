function primes_until(n::Int64)
  primes = [p for p in 2:n]

  index = 1
  while index <= length(primes)
    d = primes[index]

    filter!(p -> p == d || p % d != 0, primes)

    if isempty(primes) break end
    index += 1
  end

  primes
end

solution = sum(primes_until(2_000_000))

println(solution)
