program reshape_array
    implicit none

    integer, parameter :: a = 1, b = 2, c = 3, d = 4
    real :: Data(a, b, c, d)
    real :: Data_new(d, c, b, a)
    real :: Data_new_2(d, c, b, a)
    real :: Data_1D(a*b*c*d)
    integer :: i, j, k, l, m
    m = 0
    ! Initialize the Data array with some values
    do i = 1, a
        do j = 1, b
            do k = 1, c
                do l = 1, d
                    m = m + 1
                    Data(i, j, k, l) = m
                end do
            end do
        end do
    end do

    ! Print original Data array
    print *, 'Original Data array:'
    do i = 1, a
        do j = 1, b
            do k = 1, c
                do l = 1, d
                    print *, 'Data(', i, ',', j, ',', k, ',', l, ') = ', Data(i, j, k, l)
                end do
            end do
        end do
    end do

    ! Reshape the array to new dimensions
    Data_new = reshape( Data, shape(Data_new))
    Data_new_2 = reshape( Data, shape(Data_new), order = (/4, 3, 2, 1/))
    Data_1D = reshape(Data, shape(Data_1D))

    ! Print reshaped Data_new array
    print *, 'Reshaped Data_new array:'
    do i = 1, a; do j = 1, b; do k = 1, c ; do l = 1, d
            print *, 'Data_new(', l, ',', k, ',', j, ',', i, ') = ', Data_new(l, k, j, i)
    enddo; enddo; enddo; enddo

    print *, 'Reshaped Data_new_2 array with order:'
    do i = 1, a; do j = 1, b; do k = 1, c ; do l = 1, d
                    print *, 'Data_new_2(', l, ',', k, ',', j, ',', i, ') = ', Data_new_2(l, k, j, i)
    enddo; enddo; enddo; enddo

    print *, Data_1D

    print *, "last layer Data: ", Data(1,1,1,:)
    print *, "last layer Data_new: " , Data_new(:,1,1,1)
    print *, "Shape Data = ",  shape(Data)
    print *, "Shape Data_new = ",  shape(Data_new)
end program reshape_array