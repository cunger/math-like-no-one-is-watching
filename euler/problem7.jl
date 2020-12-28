function sieve(primes, unsieved)
  primes = [primes; unsieved]

  index = 1
  while index <= length(primes)
    d = primes[index]

    filter!(p -> p == d || p % d != 0, primes)

    if isempty(primes) break end
    index += 1
  end

  primes
end

function nth_prime(n::Int64)
  primes = []
  offset = 2

  while length(primes) < n
    primes = sieve(primes, [x for x in offset:(offset + 10_000)])
    offset = offset + 10_000
  end

  primes[n]
end

println(nth_prime(10001))
