// Moden Euklidian algorithm for determining the greatest common divisor.
// Source: https://www.wikiwand.com/de/Gr%C3%B6%C3%9Fter_gemeinsamer_Teiler
pub fn greatest_common_divisor(a: u64, b: u64) {
  if a == 0 { return abs(b); }
  if b == 0 { return abs(a); }

  let h;
  while b != 0 {
    h = a % b;
    a = b;
    b = h;
  }

  abs(a)
}

// Euler's totient function counts the positive integers up to a given integer n
// that are co-prime to n (i.e. the only positive integer that divides both is 1).
//
// Examples:
// phi(1) = 1
// phi(6) = 2
// phi(13) = 12
fn phi(n: u64) {
  let count = 0;

  for a in 1..n {
    if greatest_common_divisor(a, n) == 1 {
      count += 1;
    }
  }

  count
}

// Agrawal–Kayal–Saxena (AKS) primality test.
//
// Complexity: O(log^O(1) n)
// Background: https://terrytao.wordpress.com/2009/08/11/the-aks-primality-test/
// Source: https://www.cse.iitk.ac.in/users/manindra/algebra/primality_v6.pdf
pub fn is_prime(num: u64) -> bool {
  if is_perfect_power(num) {
    return false;
  }

  // Find the smallest r such that ord_r(n) > log^2 n.
  let r = 0;
  while r < num {
    r += 1;
    if ord(r, num) > log(num)^2 {
      break;
    }
  }

  for a in 1..r { // TODO check
    if 1 < greatest_common_divisor(a, n) < n {
      return false;
    }
  }

  if num <= r {
    return true;
  }

  // for a = 1 ... sqrt(phi(r))*log(n) do
  //   if (x+a)n ≠ xn+a (mod (xr−1,n)):
  //     return false
  //   end
  // end

  true
}

// Brute-force check whether a given number is a perfect power.
// A number n is a perfect power iff n = x^k for some integers x, k > 1.
pub fn is_perfect_power(n: u64) -> bool {
  for x in 2..n {
    for k in 2..n {
      if x^k == n {
        return true;
      }
    }
  }

  false
}

// TODO Check!
fn ord(r: u64, n: u64) -> u64 {
  for k in 1..n {
    if n^k % r == 1 {
      return k;
    }
  }

  n
}
