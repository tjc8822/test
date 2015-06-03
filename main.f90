program test   
    use omp_lib
    implicit none
    real(8) ::  dx, x
    integer, parameter  ::  n = 100000
    real(8) ::  y(n)
    integer ::  start, finish, rate
    integer ::  nthreads, i, j
    
    !$ print *, "How many threads to use? "
    !$ read *, nthreads
    !$ call omp_set_num_threads(nthreads)
    
    call system_clock(start)
    
    !$ call omp_set_num_threads(nthreads)

    dx = 1.d0/ (real(n)+1.d0)
    print*, "Test OMP"

    !$omp parallel do private(x)
    do i = 1,n
        do j =1,n 
       x = real(i) * dx
       y(i) = exp(x) *cos(x) * sin(x) * sqrt(5.d0*x + 6.d0)
    enddo
    enddo

    call system_clock(finish,rate)
    print*, "Elpsed time is",(float(finish)-float(start))/float(rate), "seconds"

end program test
