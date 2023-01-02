FC = gfortran-8

clean:
	rm -f *.o *.mod *.smod a.out

build: tests.f90
	$(FC) prime.f90 $^ -o run_tests
