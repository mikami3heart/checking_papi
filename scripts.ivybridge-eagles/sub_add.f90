subroutine sub_add(a,b,c,n)
integer :: n
real a(n), b(n), c(n)
do i=1,n
c(i)=a(i)+b(i)
end do
return
end

