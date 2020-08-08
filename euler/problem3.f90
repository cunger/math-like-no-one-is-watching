! ----------------------------------------------------------------------------
! Project Euler - Problem 3
! https://projecteuler.net/problem=3
!
! The prime factors of 13195 are 5, 7, 13 and 29.
! What is the largest prime factor of the number 600851475143?
! ----------------------------------------------------------------------------

program problem3
  implicit none

  integer, parameter :: LONG = selected_int_kind(12)
  integer(kind=LONG) :: num

  num = 600851475143_LONG

  print *, num
  print *, huge(num) ! 9223372036854775807
end program problem3
