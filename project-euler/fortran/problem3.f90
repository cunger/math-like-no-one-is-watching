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
  print *, largest_prime_factor_of(num)

  ! ---- Tests ----

  write (*,*) largest_prime_factor_of(2_LONG) == 2_LONG
  write (*,*) largest_prime_factor_of(4_LONG) == 2_LONG
  write (*,*) largest_prime_factor_of(10_LONG) == 5_LONG
  write (*,*) largest_prime_factor_of(13195_LONG) == 29_LONG

contains

  function largest_prime_factor_of(num) result (factor)
    implicit none

    integer(kind=LONG), intent(in) :: num
    integer(kind=LONG) :: factor

    integer(kind=LONG) :: n
    integer(kind=LONG) :: i
    integer(kind=LONG) :: upper_bound

    n = num
    factor = num
    upper_bound = floor(sqrt(real(n, LONG)))

    do while (mod(n, 2_LONG) == 0)
      n = n / 2_LONG
      factor = 2_LONG
    end do

    do i = 3_LONG, upper_bound, 2
      do while (mod(n, i) == 0)
        n = n/i
        factor = i
      end do
    end do

    if (n > 2) then
      factor = n
    end if
  end function largest_prime_factor_of
end program problem3
