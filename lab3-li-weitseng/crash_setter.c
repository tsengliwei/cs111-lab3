#include <stdio.h>
#include <fcntl.h>
#include <stdint.h>
#include "ospfs.h"


/*Main called in order to crash the OSPFS File System.
The user space call of ioctl will set nwrites_to_crash.*/
int main(int argc, char **argv){
	int fd;
	fd = open("./test/hello.txt", O_RDONLY | O_CREAT);

	ioctl(fd, IOCTL_CRASH, atoi(argv[1]));
	close(fd);
}