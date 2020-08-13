// Brute-force check whether a given number is a perfect power.
// A number n is a perfect power iff n = x^k for some integers x, k > 1.
pub fn is_perfect_power(n: i64) -> bool {
  for x in 2..n {
    for k in 2..n {
      if x^k == n {
        return true;
      }
    }
  }

  false
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn sample_cases() {
    assert!(is_perfect_power(4));
    // TODO and more
  }
}
