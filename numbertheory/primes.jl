function is_prime(n::Int64)
  # The first prime is 2, thus:
  # If n is < 2, then n is not prime by definition.
  # If n is 2, then n is prime by definition.

  if (n <= 1) return false end
  if (n == 2) return true end

  # If n is > 2, then look for divisors other than 1 and n.
  # If n is divisible by 2, then it's not prime.
  # Else check all uneven numbers from 3 to sqrt(n).

  if (mod(n, 2) == 0) return false end

  limit = sqrt(n)
  i = 3
  while (i <= limit)
    if (n % i == 0) return false end
    i = i + 2
  end

  return true
end

# Sieve of Eratosthenes
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

# Tests

using Test

@testset "Prime check" begin
  @test !is_prime(1)
  @test is_prime(2)
  @test is_prime(3)
  @test !is_prime(21)
  @test is_prime(23)
end

@testset "Prime generation" begin
  @test [2, 3, 5, 7] == primes_until(10)
end
