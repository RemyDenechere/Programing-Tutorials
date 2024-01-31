module GetNetCDFinf
    use Parameters
    use Structure 
    use netcdf 

    implicit none 

    contains 

    subroutine Initialisation(Spinup, Var, Nspace, Ntime, Data_F_ini, Data, DataTp, DataTb, Datadz, Datadet, DataZM)
        logical, intent(in) :: Spinup
        integer, intent(inout) :: Nspace, Ntime
        type(Structure_group) :: Var
        type(ini_fish_data), intent(inout) :: Data_F_ini
        type(Save_structure2D), intent(inout) :: Data
        real(dp), dimension(:, :), allocatable, intent(inout) :: DataTp, DataTb, &
                                                                Datadz, Datadet, &
                                                                DataZM

        CALL griddims2D(dir_Tb, Nspace, Ntime, var)                                                        
        CALL ini_input2D(Nspace, Ntime, DataTp, DataTb, Datadz, Datadet, DataZM)
        Call ini_input_fish(Spinup, Nspace, Data_F_ini)
        CALL init_save_data2D(Data, Nspace)
        
        
        ! Individual Mass (g) geometric mean for each group 
        Var%Sf%w = 10.0**((log10(0.001)+log10(0.5))/2)
        Var%Sp%w = 10.0**((log10(0.001)+log10(0.5))/2)
        Var%Sd%w = 10.0**((log10(0.001)+log10(0.5))/2)
        Var%Mf%w = 10.0**((log10(0.5)+log10(250.0))/2) 
        Var%Mp%w = 10.0**((log10(0.5)+log10(250.0))/2) 
        Var%Md%w = 10.0**((log10(0.5)+log10(250.0))/2) 
        Var%Lp%w = 10.0**((log10(250.0)+log10(125000.0))/2)
        Var%Ld%w = 10.0**((log10(250.0)+log10(125000.0))/2)

        ! print*, " Small size ", Var%Sd%w
        ! print*, " Medium size ", Var%Md%w
        ! print*, " Large size ", Var%Ld%w

    end subroutine Initialisation
    
    subroutine save_data(Spinup, that, Nspace)
        logical, intent(in) :: Spinup
        type(Save_structure2D) :: that
        integer, intent(in) :: Nspace
        integer :: i
    
        if (Spinup) then 
            ! Write each variable to a separate NetCDF file : ---------------------------
            call write_nc_file1D(Dir_IniBE, 'BE', that%BE(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniSf, 'Sf', that%Sf(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniSp, 'Sp', that%Sp(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniSd, 'Sd', that%Sd(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniMf, 'Mf', that%Mf(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniMp, 'Mp', that%Mp(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniMd, 'Md', that%Md(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniLp, 'Lp', that%Lp(1:Nspace, Nmonth), Nspace)
            call write_nc_file1D(Dir_IniLd, 'Ld', that%Ld(1:Nspace, Nmonth), Nspace)
            
        else
            ! Write each variable to a separate NetCDF file : ---------------------------
            call write_nc_file2D('../output/BE_bio.nc', 'BE', that%BE, Nspace, Nmonth)
            call write_nc_file2D('../output/Sf_bio.nc', 'Sf', that%Sf, Nspace, Nmonth)
            call write_nc_file2D('../output/Sp_bio.nc', 'Sp', that%Sp, Nspace, Nmonth)
            call write_nc_file2D('../output/Sd_bio.nc', 'Sd', that%Sd, Nspace, Nmonth)
            call write_nc_file2D('../output/Mf_bio.nc', 'Mf', that%Mf, Nspace, Nmonth)
            call write_nc_file2D('../output/Mp_bio.nc', 'Mp', that%Mp, Nspace, Nmonth)
            call write_nc_file2D('../output/Md_bio.nc', 'Md', that%Md, Nspace, Nmonth)
            call write_nc_file2D('../output/Lp_bio.nc', 'Lp', that%Lp, Nspace, Nmonth)
            call write_nc_file2D('../output/Ld_bio.nc', 'Ld', that%Ld, Nspace, Nmonth)
            call write_nc_file2D('../output/dZm.nc', 'dZm', that%Zcons_VS_dZm, Nspace, Nmonth)

        end if 


    end subroutine save_data 


    subroutine write_nc_file3D(filename, varname, var, Nlat, Nlong, Ntime)
        character(*), intent(in) :: filename, varname
        integer, intent(in) :: Nlat, Nlong, Ntime
        real(dp), dimension(Nlat, Nlong, Ntime), intent(in) :: var
        integer :: ncid, dimids(3), varid
        integer :: status

        ! Create the NetCDF file
        status = nf90_create(filename, NF90_CLOBBER, ncid)
        
        ! Define the dimensions
        status = nf90_def_dim(ncid, 'Nlat', Nlat, dimids(1))
        status = nf90_def_dim(ncid, 'Nlong', Nlong, dimids(2))
        status = nf90_def_dim(ncid, 'Ntime', Ntime, dimids(3))

        ! Define the variable
        status = nf90_def_var(ncid, varname, NF90_REAL, dimids, varid)

        ! End the definitions mode
        status = nf90_enddef(ncid)
        
        ! Write the variable data
        status = nf90_put_var(ncid, varid, var)

        ! add a unit attribute 
        status = nf90_put_att(ncid, varid, 'units', 'gWW m-2')
        
        ! Close the file
        status = nf90_close(ncid)
    end subroutine write_nc_file3D

    subroutine write_nc_file2D(filename, varname, var, Nspace, Ntime)
        character(*), intent(in) :: filename, varname
        integer, intent(in) :: Nspace, Ntime
        real(dp), dimension(Nspace, Ntime), intent(in) :: var
        integer :: ncid, dimids(2), varid
        integer :: status

        ! Create the NetCDF file
        status = nf90_create(filename, NF90_CLOBBER, ncid)
        
        ! Define the dimensions
        status = nf90_def_dim(ncid, 'Space', Nspace, dimids(1))
        status = nf90_def_dim(ncid, 'Time' , Ntime , dimids(2))

        ! Define the variable
        status = nf90_def_var(ncid, varname, NF90_REAL, dimids, varid)

        ! End the definitions mode
        status = nf90_enddef(ncid)
        
        ! Write the variable data
        status = nf90_put_var(ncid, varid, var)

        ! add a unit attribute 
        status = nf90_put_att(ncid, varid, 'units', 'gWW m-2')
        
        ! Close the file
        status = nf90_close(ncid)
    end subroutine write_nc_file2D
    

    subroutine write_nc_file1D(filename, varname, var, Nspace)
        character(*), intent(in) :: filename, varname
        integer, intent(in) :: Nspace
        real(dp), dimension(Nspace), intent(in) :: var
        integer :: ncid, dimids(1), varid
        integer :: status

        ! Create the NetCDF file
        status = nf90_create(filename, NF90_CLOBBER, ncid)
        
        ! Define the dimensions
        status = nf90_def_dim(ncid, 'Space', Nspace, dimids(1))

        ! Define the variable
        status = nf90_def_var(ncid, varname, NF90_REAL, dimids, varid)

        ! End the definitions mode
        status = nf90_enddef(ncid)
        
        ! Write the variable data
        status = nf90_put_var(ncid, varid, var)

        ! add a unit attribute 
        status = nf90_put_att(ncid, varid, 'units', 'gWW m-2')
        
        ! Close the file
        status = nf90_close(ncid)
    end subroutine write_nc_file1D
    
    

    !:====================================================================== 
    ! Get the input values for the given lat long and time 
    !:======================================================================  
    subroutine Get_Environental_data3D(this, DataTp, DataTb, Datadz, Datadet, DataZM, ilat, ilong, itime)
        type(Structure_group), intent(inout) :: this
        integer :: ilat, ilong, itime
        real(dp), dimension(:, :, :), allocatable, intent(inout) :: DataTp, DataTb, &
                                                                    Datadz, Datadet, &
                                                                    DataZM
        
        this%Tp =  DataTp(ilat, ilong, itime)
        this%Tb = DataTb(ilat, ilong, itime)
        this%dz = Datadz(ilat, ilong, itime)
        this%det = Datadet(ilat, ilong, itime)
        this%Mz%B = DataZM(ilat, ilong, itime)
    end subroutine Get_Environental_data3D

    !:====================================================================== 
    ! Get the input values for the given lat long and time 
    !:======================================================================  
    subroutine Get_Environental_data2D(this, DataTp, DataTb, Datadz, Datadet, DataZM, ispace, itime)
        type(Structure_group), intent(inout) :: this
        integer :: ispace, itime
        real(dp), dimension(:, :), allocatable, intent(inout) :: DataTp, DataTb, &
                                                                Datadz, Datadet, &
                                                                DataZM
        
        this%Tp =  DataTp(ispace, itime)
        this%Tb = DataTb(ispace, itime)
        this%dz = Datadz(ispace, itime)   * convers_dZm
        this%det = Datadet(ispace, itime) * convers_det
        this%Mz%B = DataZM(ispace, itime) * convers_zm

        ! print*, "-------------------------------------"
        ! print*, "     Environemental condition        "
        ! print*, "Tp                 ", this%Tp
        ! print*, "Tb                 ", this%Tb
        ! print*, "dz                 ", this%dz
        ! print*, "det                ", this%det
        ! print*, "Mz                 ", this%Mz%B
        ! print*, "-------------------------------------"

    end subroutine Get_Environental_data2D


    !:====================================================================== 
    ! Load all the imput values to force the model
    !:======================================================================  
    subroutine ini_input3D(DataTp, DataTb, Datadz, Datadet, DataZM)
        ! Declare variables
        real(dp), dimension(:, :, :), allocatable, intent(inout) :: DataTp, DataTb, &
                                                                    Datadz, Datadet, &
                                                                    DataZM
        integer :: ncid_Tb, ncid_Tp, ncid_zf, ncid_dz, ncid_det, ierr
        integer :: nvars_Tb, nvars_Tp, nvars_zf, nvars_dz, nvars_det
        integer ::  varid_Tb = 18, & 
                    varid_Tp = 18, & 
                    varid_zf = 37, &
                    varid_dz = 37, &
                    varid_det = 44
        integer :: varshape_Tb, varshape_Tp, varshape_zf, varshape_dz, varshape_det
        character(250) :: varname_Tb, varname_Tp, varname_zf, varname_dz, varname_det
        integer :: Nlat=0, Nlong=0, Ntime=0

        ! Get the input grid file: 
        CALL readgrid3D(dir_Tb, varid_Tb, Nlat, Nlong, Ntime, DataTp)
        CALL readgrid3D(dir_Tp, varid_Tp, Nlat, Nlong, Ntime, DataTb)
        CALL readgrid3D(dir_zf, varid_zf, Nlat, Nlong, Ntime, DataZM)
        CALL readgrid3D(dir_dz, varid_dz, Nlat, Nlong, Ntime, Datadz)
        CALL readgrid3D(dir_det, varid_det, Nlat, Nlong, Ntime, Datadet)      

    end subroutine ini_input3D


    !:====================================================================== 
    ! Load all the imput values to force the model
    !:======================================================================  
    subroutine ini_input2D(Nspace, Ntime, DataTp, DataTb, Datadz, Datadet, DataZM)
        ! Declare variables
        real(dp), dimension(:, :), allocatable, intent(inout) :: DataTp, DataTb, &
                                                                Datadz, Datadet, &
                                                                DataZM
        integer :: ncid_Tb, ncid_Tp, ncid_zf, ncid_dz, ncid_det, ierr
        integer :: nvars_Tb, nvars_Tp, nvars_zf, nvars_dz, nvars_det
        integer :: varshape_Tb, varshape_Tp, varshape_zf, varshape_dz, varshape_det
        character(250) :: varname_Tb, varname_Tp, varname_zf, varname_dz, varname_det
        integer :: Nspace, Ntime

        ! Get the input grid file: 
        CALL readgrid2D(dir_Tb, 1, Nspace, Ntime, DataTb)
        CALL readgrid2D(dir_Tp, 1, Nspace, Ntime, DataTp)
        CALL readgrid2D(dir_zf, 1, Nspace, Ntime, DataZM)
        CALL readgrid2D(dir_dz, 1, Nspace, Ntime, Datadz)
        CALL readgrid2D(dir_det, 1, Nspace, Ntime, Datadet)

    end subroutine ini_input2D


    subroutine ini_input_fish(Spinup, Nspace, this)
        type(ini_fish_data) :: this
        logical, intent(in) :: Spinup
        integer, intent(in) :: Nspace

        if (Spinup .eqv. .false.) then 
            CALL readgrid(dir_IniSf, 1, Nspace, this%IniSf)
            CALL readgrid(dir_IniSp, 1, Nspace, this%IniSp)
            CALL readgrid(dir_IniSd, 1, Nspace, this%IniSd)
            CALL readgrid(dir_IniMf, 1, Nspace, this%IniMf)
            CALL readgrid(dir_IniMp, 1, Nspace, this%IniMp)
            CALL readgrid(dir_IniMd, 1, Nspace, this%IniMd)
            CALL readgrid(dir_IniLp, 1, Nspace, this%IniLp)
            CALL readgrid(dir_IniLd, 1, Nspace, this%IniLd)
            CALL readgrid(dir_IniBE, 1, Nspace, this%IniBE)
        end if

        CALL readgrid(dir_H, 1, Nspace, this%H)

    end subroutine ini_input_fish


    !:====================================================================== 
    ! Get the dimension of the netCDF 3D gridfile
    !:======================================================================  
    subroutine griddims3D(dir, Nlat, Nlong, Ntime, this)
        type(Structure_group), intent(inout) :: this
        character(LEN=280), intent(in) :: dir
        integer, intent(inout) :: Nlat, Nlong, Ntime
        integer :: ncid
        character(LEN=250) :: xname, yname, zname
        integer :: ierr
        
        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            STOP
        end if
        
        !inquire about the dimensions:
        ierr = nf90_inquire_dimension(ncid, 1, xname, Nlat)
        ierr = nf90_inquire_dimension(ncid, 2, yname, Nlong)
        ierr = nf90_inquire_dimension(ncid, 3, zname, Ntime)
        
        !Close netCDF file
        ierr = nf90_close(ncid)
        
        ! print outputs: -------------------------------------------
        print *, "------------------------------------"
        print*, "1st dimension =", trim(xname), "; length = ", Nlat
        print*, "2nd dimension =", trim(yname), "; length = ", Nlong
        print*, "3rd dimension =", trim(zname), "; length = ", Ntime
        print *, "------------------------------------"      
        
        ! Save lat long, and time in structure: 
        this%Nlat = Nlat
        this%Nlong = Nlong
        this%Ntime = Ntime
    end subroutine griddims3D

    !:====================================================================== 
    ! Get the dimension of the netCDF 3D gridfile
    !:======================================================================  
    subroutine griddims2D(dir, Nspace, Ntime, this)
        type(Structure_group), intent(inout) :: this
        character(LEN=280), intent(in) :: dir
        integer, intent(inout) :: Nspace, Ntime
        integer :: ncid
        character(LEN=250) :: xname, yname
        integer :: ierr
        
        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            STOP
        end if
        
        !inquire about the dimensions: ----------------------------
        ierr = nf90_inquire_dimension(ncid, 1, xname, Nspace)
        ierr = nf90_inquire_dimension(ncid, 2, yname, Ntime)
        
        
        !Close netCDF file
        ierr = nf90_close(ncid)
        
        ! print outputs: -------------------------------------------
        print *, "------------------------------------"
        print*, "1st dimension =", trim(xname), "; length = ", Nspace
        print*, "2nd dimension =", trim(yname), "; length = ", Ntime
        print *, "------------------------------------"      
        
        ! Save lat long, and time in structure: 
        this%Nspace = Nspace
        this%Ntime = Ntime
    end subroutine griddims2D


    !:====================================================================== 
    ! read a netCDF gridfile
    !:======================================================================  
    subroutine readgrid3D(dir, varid, Nlat, Nlong, Ntime, values)
        character(LEN=280), intent(in) :: dir
        integer, intent(in) :: Nlat, Nlong, Ntime, varid 
        real(dp), dimension(:, :, :), allocatable, intent(inout) :: values
        character(LEN=250) :: varname
        integer :: ierr, vartype, ndims, nAtts, ncid

        allocate(values(Nlat, Nlong, Ntime))
        
        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            stop
        end if
        
        ! Get the values of the coordinates and put them in xpos & ypos 
        ierr = nf90_inquire_variable(ncid, varid, varname, vartype, ndims, nAtts = nAtts)
        
        ! Get values of the variable 
        ierr = nf90_get_var(ncid, varid, values)
        
        ! Close the netCDF files : ----------------------------------------------------------------
        ierr = nf90_close(ncid)
    end subroutine readgrid3D

    !:====================================================================== 
    ! read a netCDF gridfile
    !:======================================================================  
    subroutine readgrid2D(dir, varid, Nspace, Ntime, values)
        character(LEN=280), intent(in) :: dir
        integer, intent(in) :: Nspace, Ntime, varid 
        real(dp), dimension(:, :), allocatable, intent(inout) :: values
        character(LEN=250) :: varname
        integer :: ierr, vartype, ndims, nAtts, ncid
        ! Problem the function does not read the values 

        allocate(values(Nspace, Ntime))

        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            stop
        end if
        
        ! Get the values of the coordinates and put them in xpos & ypos 
        ierr = nf90_inquire_variable(ncid, varid, varname, vartype, ndims, nAtts = nAtts)
        
        ! Get values of the variable 
        ierr = nf90_get_var(ncid, varid, values)
        
        ! Close the netCDF files : ----------------------------------------------------------------
        ierr = nf90_close(ncid)
    end subroutine readgrid2D

    subroutine readgrid(dir, varid, Nspace, values)
        character(LEN=280), intent(in) :: dir
        integer, intent(in) :: Nspace, varid 
        real(dp), dimension(:), allocatable, intent(inout) :: values
        character(LEN=250) :: varname
        integer :: ierr, vartype, ndims, nAtts, ncid

        allocate(values(Nspace))
        
        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            stop
        end if
        
        ! Get the values of the coordinates and put them in xpos & ypos 
        ierr = nf90_inquire_variable(ncid, varid, varname, vartype, ndims, nAtts = nAtts)
        
        ! Get values of the variable 
        ierr = nf90_get_var(ncid, varid, values)
        
        ! Close the netCDF files : ----------------------------------------------------------------
        ierr = nf90_close(ncid)
    end subroutine readgrid
    
    !:====================================================================== 
    ! Get information about the variables in the netCDF
    !:======================================================================  
    subroutine GetVariableinfo(dir, varid, varname)
        character(280), intent(in) :: dir
        integer, intent(in) :: varid
        character(250), intent(inout) :: varname
        integer :: ncid
        integer :: nvars, vartype, ndims, nAtts
        integer :: ierr, i
        integer, dimension(2) :: dimlength

        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            stop
        else 
            print *, "Opened -", trim(dir)
        end if
        ! Get number of variables in the netCDF file----------------
        ierr = nf90_inquire(ncid, ndims, nvars)
        print*, "Number of variables :", nvars

        ierr = nf90_inquire_variable(ncid, varid, varname, vartype, ndims, &
                                      dimids = dimlength,&
                                      nAtts = nAtts)
        print *, "--------------------------------------------------"
        print *, "Variable ID                    : ", varid
        print *, "Variable Name                  : ", trim(varname)
        print *, "number of dimensions           : ", ndims
        print *, "Number of attributes           : ", nAtts
        print *, "Length of dimensions           : ", dimlength                
        ! Close the netCDF files : ----------------------------------------------------------------
        ierr = nf90_close(ncid)
    end subroutine GetVariableinfo

    subroutine Get_all_Variable_info(dir)
        character(280), intent(in) :: dir
        character(250) :: varname, varname_att
        integer, dimension(:), allocatable :: dimids
        integer :: ncid, varid
        integer :: nvars, vartype, ndims
        integer :: ierr, i

        ! Open NetCDF: --------------------------------------------
        ierr = nf90_open(dir, NF90_NOWRITE, ncid)
        if (ierr /= NF90_NOERR) then
            print *, "Error opening file: ", trim(dir)
            stop
        else 
            print *, "Opened -", trim(dir)
        end if
        ! Get number of variables in the netCDF file----------------
        ierr = nf90_inquire(ncid, ndims, nvars)
        print *, "--------------------------------------------------"
        print *, "Number of variables :", nvars
        
        Do i = 1, nvars
            ierr = nf90_inquire_variable(ncid, i, varname, vartype, ndims, dimids = dimids)
            print *, "--------------------------------------------------"
            print *, "Variable ID                    : ", i
            print *, "Variable Name                  : ", trim(varname)
            print *, "Number of dimensions           : ", ndims
            print *, "Dimension ID                   : ", dimids
        end Do
        
        ! Close the netCDF files : ----------------------------------------------------------------
        ierr = nf90_close(ncid)
    end subroutine Get_all_Variable_info


end module GetNetCDFinf