// Modern Euklidian algorithm for determining the greatest common divisor.
// Source: https://www.wikiwand.com/de/Gr%C3%B6%C3%9Fter_gemeinsamer_Teiler
pub fn greatest_common_divisor(a: i64, b: i64) -> i64 {
  if a == 0 { return b.abs(); }
  if b == 0 { return a.abs(); }

  let mut a = a;
  let mut b = b;
  let mut h;
  while b != 0 {
    h = a % b;
    a = b;
    b = h;
  }

  a.abs()
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn gcd_sample_cases() {
    assert_eq!(greatest_common_divisor(3, 3), 3);
    assert_eq!(greatest_common_divisor(4, 6), 2);
    // TODO and more
  }
}
