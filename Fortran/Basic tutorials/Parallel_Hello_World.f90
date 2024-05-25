program Parallel_Hello_World
    use OMP_LIB

    implicit none
  
    ! Define constants
    integer, parameter :: n = 1000
    real(8) :: x(n), y(n), T1, T2
    integer :: i
     

    call omp_set_num_threads(4)

    !$OMP PARALLEL
        print*, "Hello from process: ", OMP_GET_THREAD_NUM()
    !$OMP END PARALLEL
    
    !===========================================================!
    !                  Test parallele on loop                   !
    !===========================================================!
  
    ! Initialize the input array
    do i = 1, n
      x(i) = real(i, 8)
    end do
  
    ! Parallelize the simulation using OpenMP
    call cpu_time(T1)
    !$omp parallel do
    do i = 1, n
        y(i) = x(i) ** 2
    end do
    !$omp end parallel do
    call cpu_time(T2)
  
    ! Print the results
    print *, "Simulation time", T2-T1


end program  Parallel_Hello_World
