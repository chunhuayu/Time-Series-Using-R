# eg. v is a vector, A subvector v[s], s is a Boolean vector, (consisting of TRUEs and FALSEs) that is of the same length as v.
# The vector v[s] is then a subvector of v consisting of those elements of v for which the corresponding element in s is TRUE; 
# elements in v whose corresponding element in s is FALSE are discarded from v[s].

# A second way to subset a vector is to construct s so that it contains the position of the elements to be retained and 
# v[s] will return the desired subvector. A variation of this approach is to form a subvector by deletion. 
### Unwanted elements are designated by giving their positions multiplied by -1. An illustration follows.
> v=1:5
# This creates a vector containing the first five positive integers.
>v
[1] 1 2 3 4 5
> names(v)
  NULL
# By default, the components of v are unnamed, so names(v) returns an empty vector denoted by the object NULL.
> names(v)=c('A','B','C','D','E')
# This is the method of assigning names to the components of a vector.
>v 
ABCDE 
12345
> names(v)=='C'
[1] FALSE FALSE TRUE FALSE FALSE 
> v[names(v)=='C']
 C
 3
> v[3]
C 
3
> v[-3] 
ABDE 
1245
# subsets v by supplying the positions of the unwanted elements.
