module prime

contains

  function is_prime(n)
    implicit none

    integer, intent(in) :: n ! input number
    logical :: is_prime      ! output boolean
    real :: limit            ! square root of input, which provides the
                             ! upper bound of what needs to be checked
    integer :: i             ! loop variable

    ! The first prime is 2, thus:
    ! If n is < 2, then n is not prime by definition.
    ! If n is 2, then n is prime by definition.
    ! If n is > 2, then look for divisors other than 1 and n.
    ! If n is divisible by 2, then it's not prime.
    ! Else check all uneven numbers from 3 to sqrt(n).

    if (n <= 1) then
      is_prime = .false.
    else if (n == 2) then
      is_prime = .true.
    else if (mod(n, 2) == 0) then
      is_prime = .false.
    else
      is_prime = .true.
      limit = sqrt(real(n))
      i = 3
      do while (i <= limit)
        if (mod(n, i) == 0) then
          is_prime = .false.
          exit
        end if
        i = i + 2
      end do
    end if
  end function is_prime
end module prime
