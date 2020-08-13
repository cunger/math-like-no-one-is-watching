// ----------------------------------------------------------------------------
// Project Euler - Problem 3
// https://projecteuler.net/problem=3
//
// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?
// ----------------------------------------------------------------------------

use crate::math::number;

pub fn solve() -> i64 {
  let num = 600_851_475_143;

  if number::is_prime(num) {
    return num;
  }

  0
}
