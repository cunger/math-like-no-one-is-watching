// TODO Check!
pub fn ord(r: i64, n: i64) -> i64 {
  for k in 1..n {
    if n^k % r == 1 {
      return k;
    }
  }

  n
}
