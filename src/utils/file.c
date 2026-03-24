#include "file.h"
#include <stdio.h>
#include <errno.h>
#include <string.h>

int print_file(const char *path) {
	
	int ch;
	FILE *f = fopen(path, "r");
	
	if (f == NULL) {
		fprintf(stderr, ORANGEX "[ERROR] " RESETX);
		fprintf(stderr, GREYX "%s" RESETX, strerror(errno));
		return 1;
	}
	
	while((ch = fgetc(f)) != EOF) {
		putchar(ch);
	}
	fclose(f);
	return 0;
}