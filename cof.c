#include <stdio.h>
#include "./utils/file.h"

int main(int argc, char *argv[]) {
	
	if (argc < 2) {
		printf(ORANGEX "Usages: " GREYX "%s /path/to/the/file\n" RESETX, argv[0]);
		return 1;
	}
	for (int i = 1; i < argc; i++) {
		printf(ORANGEX "[FILE] " GREYX "%s\n" RESETX, argv[i]);
		print_file(argv[i]);
		printf("\n");
	}
	return 0;
}