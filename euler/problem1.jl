# ----------------------------------------------------------------------------
# Project Euler - Problem 1
# https://projecteuler.net/problem=1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
# ----------------------------------------------------------------------------

# Calculates the sum of an arithmetic sequence using the
# artihmetic series formula.
# * n the number of elements in the sequence.
# * a_1 is the first element of the sequence.
# * a_n is the last element of the sequence.
function arithmetic_sum(n, a_1, a_n)
  0.5 * n * (a_1 + a_n)
end

# Calculates the sum of all multiples of i from 1 to limit - 1,
# using the sum formula of arithmetic series.
#
# For example, the sequence of all multiples of 3 below 1000 is
# (3, 6, 9, 12, ..., 999), which we can write as 3 * (1, 2, 3, 4, ..., 333),
# the multiple of an arithmetic series with 333 elements,
# 1 being the first one and 333 the last one.
# The sum thus can be calculates as: 3 * arithmetic_sum(333, 1, 333)
#
# Complexity: O(1)
function sum_of_multiples_of(i, limit)
  # n is the number of elements in the sequence of multiples,
  # as well as the last element in that sequence.

  n = div(limit - 1, i) # Using integer division to get the floor.

  i * arithmetic_sum(n, 1, n)
end

function solve()
  limit = 1000

  sum_of_multiples_of(3, limit) +
  sum_of_multiples_of(5, limit) -
  sum_of_multiples_of(15, limit)
end

solve() |> println
