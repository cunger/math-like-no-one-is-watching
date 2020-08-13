use super::factorization::greatest_common_divisor;

// Euler's totient function counts the positive integers up to a given integer n
// that are co-prime to n (i.e. the only positive integer that divides both is 1).
pub fn phi(n: i64) -> i64 {
  let mut count = 0;

  for a in 1..n {
    if greatest_common_divisor(a, n) == 1 {
      count += 1;
    }
  }

  count
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn sample_cases() {
    assert_eq!(phi(1), 1);
    assert_eq!(phi(6), 2);
    assert_eq!(phi(13), 12);
  }
}
