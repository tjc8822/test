program test   
    use omp_lib
    implicit none
    real(8) ::  dx, x
    integer, parameter  ::  n = 10000
    real(8) ::  y(n), start, finish

    integer ::  thread_num, i, j 

    call cpu_time(start)
    !$ call omp_set_num_threads(4)

    dx = 1.d0/ (real(n)+1.d0)
    print*, "Test OMP"

    !$omp parallel do private(x)
    do i = 1,n
        do j =1,n 
       x = real(i) * dx
       y(i) = exp(x) *cos(x) * sin(x) * sqrt(5.d0*x + 6.d0)
    enddo
    enddo

    call cpu_time(finish)
    print*, "Elpsed time is", finish-start, "seconds"

end program test
