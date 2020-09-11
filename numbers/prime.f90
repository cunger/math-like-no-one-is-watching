module prime

contains

  function is_prime(n) result(b)
    implicit none

    integer, intent(in) :: n
    real :: m
    integer :: i
    logical :: b

    if (n <= 2) then
      b = .false.
    else if (mod(n, 2) == 0) then
      b = .false.
    else
      b = .true.
      m = sqrt(real(n))
      i = 3
      do while (i <= m)
        if (mod(n, i) == 0) then
          b = .false.
          exit
        end if

        i = i + 2
      end do
    end if
  end function is_prime
end module prime
