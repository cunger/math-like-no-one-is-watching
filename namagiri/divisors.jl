# Modern Euklidian algorithm for determining the greatest common divisor.
function greatest_common_divisor(m::Int64, n::Int64)
  if (n == 0) return m end
  gcd(n, m % n)
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
