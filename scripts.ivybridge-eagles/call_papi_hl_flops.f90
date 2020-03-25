program main
!	include 'mpif.h'
include "f90papi.h"
!       include "fpapi.h"
integer*8 lflp
parameter(msize=1000, n=msize)
!       real(kind=4) amat(msize,msize), vec(msize)
!real(kind=8) amat(msize,msize), vec(msize)
real(kind=4) amat(msize,msize), vec(msize)
!       common /abc/ amat(msize,msize), vec(msize)

!	call mpi_init(ierr )
!	call mpi_comm_rank( MPI_COMM_WORLD, MYID, ierr )
!	call mpi_comm_size( MPI_COMM_WORLD, ncpus, ierr )

iret=PAPI_VER_CURRENT
call PAPIF_library_init(iret)
write (*,*) "PAPIF_library_init iret= ", iret

call PAPIF_is_initialized(iret)
write (*,*) "PAPIF_is_initialized iret= ", iret
write (*,*) "PAPI_is_initialized=", PAPI_is_initialized
write (*,*) "PAPI_NOT_INITED =", PAPI_NOT_INITED 
write (*,*) "PAPI_LOW_LEVEL_INITED  =", PAPI_LOW_LEVEL_INITED  
write (*,*) "PAPI_HIGH_LEVEL_INITED  =", PAPI_HIGH_LEVEL_INITED  

call PAPIF_num_counters(iret)
write (*,*) "PAPIF_num_counters iret= ", iret

iret=0
call PAPIF_flops(rtime, ptime, lflp, rmflops, iret)
do kloop=1,10
	do j=1, n
	vec(j)=real(j)
	do i=1, n
	amat(i,j)= 1.0
	end do
	end do

!$omp parallel private(sum)
        sum=0.0
!$omp parallel do
	do j=1, n
	do i=1, n
        sum=sum+vec(j)*vec(i)
	amat(i,j)= amat(i,j)+amat(i,j)*vec(i)
	end do
	end do
!$omp end parallel do
!$omp end parallel 
	!amat(1,1)=sum
	!amat(n,n)=sum
end do
call PAPIF_flops(rtime, ptime, lflp, rmflops, iret)
write (*,*) amat(1,1), amat(n,n), amat(1,n)
write (*,'(a,2f8.3,i10,e10.2)') "rtime, ptime, lflp, rmflops=",rtime, ptime, lflp, rmflops

!	call MPI_Finalize( ierr )

	stop
	end

