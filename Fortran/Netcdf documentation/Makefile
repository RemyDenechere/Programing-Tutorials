#
# gfortran:
#
# Compiler
FC = gfortran

# Compiler flags
FFLAGS = -O2

# netCDF library path
NETCDF_PATH_inc = "C:/Program Files/netCDF 4.9.2/include" 
NETCDF_PATH_lib = "C:/Program Files/netCDF 4.9.2/lib"

# netCDF library flags
# NETCDF_FLAGS = -I"C:/Program Files/netCDF 4.9.2/include" -L"C:/Program Files/netCDF 4.9.2/lib" -lnetcdff -lnetcdf -Wl,-Bstatic -lnetcdff -lnetcdf
NETCDF_FLAGS = `nf-config --fflags --flibs`

# Fortran source file
SOURCE = GetNetCDFinf.f90 OpenNetCDFFiles.f90

OUTPUT = Netcdf_test
# Targets
all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	$(FC) $(FFLAGS) $(SOURCE) -o $(OUTPUT) $(NETCDF_FLAGS)