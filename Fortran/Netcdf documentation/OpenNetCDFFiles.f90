program OpenNetCDFFiles
  use Parameters
  use netcdf
  use GetNetCDFInf
 ! mesozooC_zint_150m_2D.nc      pocToFloor_2_2D.nc   TEMP_mean_150m_2D.nc
 ! mesozoo_loss_zint_150m_2D.nc  TEMP_BOTTOM_2_2D.nc

  implicit none 

 ! Declare variables
  character(256) :: varname_Tb, varname_Tp, varname_zf, varname_dz, varname_det, varname_RM
  integer :: ncid_Tb, ncid_Tp, ncid_zf, ncid_dz, ncid_det, ierr, &
             nvars_Tb, nvars_Tp, nvars_zf, nvars_dz, nvars_det, &
             varid_Tb = 18, & 
             varid_Tp = 18, & 
             varid_zf = 37, &
             varid_dz = 37, &
             varid_det = 44, &
             varid_RM = 15, &
             varid = 1, &
             varshape_Tb, varshape_Tp, varshape_zf, varshape_dz, varshape_det, &
             Nlat, Nlong, Ntime, Nspace
  real(dp), dimension(:, :, :), allocatable :: Tb3D, Tp3D, zf3D, dz3D, det3D
  real(dp), dimension(:, :), allocatable :: DataTp, DataTb, &
                                            Datadz, Datadet, &
                                            DataZM
  real(dp), dimension(:, :), allocatable :: Tb2D, Tp2D, zf2D, dz2D, det2D, RM
  integer, dimension(:), allocatable :: dimid_RM
  integer :: ndim_RM, i, j
  type(Structure_group) :: Var

  print *, "Netcdf version", trim(nf90_inq_libvers())
  print *, "Get Variable information:               "
  print *, "----------------------------------------"
  CALL GetVariableInfo(dir_Tb, 1, varname_Tb)  
  CALL GetVariableInfo(dir_Tp, 1, varname_Tp)
  CALL GetVariableInfo(dir_zf, 1, varname_zf) 
  CALL GetVariableInfo(dir_dz, 1, varname_dz) 
  CALL GetVariableInfo(dir_det, 1, varname_det)


  ! Get the dimension for the input variable: (Same for all the imput files)
  CALL griddims2D(dir_Tb, Nspace, Ntime, Var)

  CALL readgrid2D(dir_Tb, 1, Nspace, Ntime, DataTp)
  ! CALL readgrid2D(dir_Tp, varid_Tp, Nspace, Ntime, DataTb)
  ! CALL readgrid2D(dir_zf, varid_zf, Nspace, Ntime, DataZM)
  ! CALL readgrid2D(dir_dz, varid_dz, Nspace, Ntime, Datadz)
  ! CALL readgrid2D(dir_det, varid_det, Nspace, Ntime, Datadet) 


  ! Close the netCDF files : ----------------------------------------------------------------
  ierr = nf90_close(ncid_Tb)
  ierr = nf90_close(ncid_Tp)
  ierr = nf90_close(ncid_zf)
  ierr = nf90_close(ncid_dz)
  ierr = nf90_close(ncid_det)  

end program OpenNetCDFFiles
