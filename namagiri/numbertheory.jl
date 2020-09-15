# Modern Euclidian algorithm. Returns the greatest common divisor
# of two integers m and n.
# (Corresponding predefined Julia function: gcd)
function greatest_common_divisor(m::Int64, n::Int64)
  m = abs(m)
  n = abs(n)

  if (n == 0)
    return m
  end

  greatest_common_divisor(n, m % n)
end

# Extended Euclidian algorithm. Returns the greatest common divisor
# of two integers m and n, together with a tuple (s,t) of integers
# such that greatest_common_divisor(m, n) = s*m + t*n.
function greatest_common_divisor_ext(m::Int64, n::Int64)
  d, coefficients, _ = greatest_common_divisor(m, n, (1, 0), (0, 1))
  return d, coefficients
end

function greatest_common_divisor(m::Int64, n::Int64, prev_coefficients::Tuple{Int64,Int64}, coefficients::Tuple{Int64,Int64})
  if (n == 0)
    return m, prev_coefficients, coefficients
  end

  s, t = coefficients
  prev_s, prev_t = prev_coefficients

  quotient = div(m, n)
  new_s = prev_s - quotient * s
  new_t = prev_t - quotient * t

  greatest_common_divisor(n, m % n, (s, t), (new_s, new_t))
end

function least_common_multiple(m::Int64, n::Int64)
  m = abs(m)
  n = abs(n)

  (m * n) / greatest_common_divisor(m, n)
end

# Given a Diophantine equation of the form
#   ax + by = x
# the function returns one solution (x0, y0).
# If there is none, then it returns (0, 0).
# If there are solutions, all further solutions have the form:
#   (x0 + div(b, d) * n, y0 - div(a, d) * n)
# for any integer n.
function solve_diophantine(a::Int64, b::Int64, c::Int64)
  d, coefficients = greatest_common_divisor_ext(a, b)
  s, t = coefficients
  m = div(c, d)

  x0 = m * s
  y0 = m * t

  (x0, y0)
end

# Tests

using Test

@testset "Greatest common divisor" begin
  @test greatest_common_divisor(3, 3) == 3;
  @test greatest_common_divisor(4, 6) == 2;
  @test greatest_common_divisor(0, 6) == 6;
  @test greatest_common_divisor(14, 15) == 1;
  @test greatest_common_divisor(578, -442) == 34;
end

@testset "Extended greatest common divisor" begin
  d, coefficients = greatest_common_divisor_ext(5767, 4453)
  @test d == 73
  @test coefficients == (17, -22)
end

@testset "Least common multiple" begin
  @test least_common_multiple(3, 3) == 3;
  @test least_common_multiple(6, 8) == 24;
  @test least_common_multiple(6, -8) == 24;
  @test least_common_multiple(21, 31) == 651;
end

@testset "Solving Diophantian equations" begin
  @test solve_diophantine(2, 2, 0) == (0, 0)
  @test solve_diophantine(2, 6, 18) == (9, 0)
  @test solve_diophantine(31, 21, 1770) == (-3540, 5310)
end
