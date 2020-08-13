use super::factorization::greatest_common_divisor;
use super::order::ord;
use super::power::is_perfect_power;
use super::totient::phi;

// Agrawal–Kayal–Saxena (AKS) primality test.
//
// Complexity: O(log^O(1) n)
// Background: https://terrytao.wordpress.com/2009/08/11/the-aks-primality-test/
// Source: https://www.cse.iitk.ac.in/users/manindra/algebra/primality_v6.pdf
pub fn is_prime(num: i64) -> bool {
  if is_perfect_power(num) {
    return false;
  }

  let n = num * 1.0; // TODO convert to f64

  // Find the smallest r such that ord_r(n) > log^2 n.
  let mut r = 0;
  while r < n {
    r += 1;
    if ord(r, n) > n.log()^2 {
      break;
    }
  }

  for a in 1..r { // TODO check
    let gcd = greatest_common_divisor(a, n);

    if gcd > 1 && gcd < n {
      return false;
    }
  }

  if n <= r {
    return true;
  }

  for b in 1..phi(r).sqrt() * n.log() {
    // if (x+a)n ≠ xn+a (mod (xr−1,n)) {
    //   return false
    // }
  }

  true
}

#[cfg(test)]
mod tests {

  #[test]
  fn sample_cases() {
    assert!(!is_prime(2));
    assert!(is_prime(3));
    assert!(!is_prime(9));
    assert!(is_prime(13));
    // TODO and more
  }
}
