# Installing fortran90 on windows

## Install MinGW for windows 
Install mMinGw [here](https://sourceforge.net/projects/mingw/), then in the windows application install:  
All basic setup 
MinGW Base System:
minGW32-gcc-fortran all classes
minGW32-gcc-v3-fortran

copy: `C:\MinGW\bin`
Go to: Environenment variable > variable untilisateur > path > edit > paste `C:\MinGW\bin`

In windows terminal: 
```
> gcc
gcc: fatal error: no input files
compilation terminated.
```

```
> gfortran
gfortran: fatal error: no input files
compilation terminated.
```

```
> gfortran -h
gfortran: error: missing argument to '-h'
gfortran: fatal error: no input files
compilation terminated.
```

## Install visual studio code
install packages: 
fotran for visual studio: extension .f90
code runner 
C/C++
makefile 

### call from terminal: 
To be able to call frotran codes from the visual studio terminal go to `settings> search: terminal> run code config> check run in terminal`