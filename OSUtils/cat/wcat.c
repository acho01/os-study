#include <stdio.h>
#include <stdlib.h>

#define BUFFER_SIZE (1024)

void single_cat(char* file_name) 
{
    FILE* fp = fopen(file_name, "r");
    if (fp == NULL) {
        printf("wcat: cannot open file\n");
        exit(1);
    }

    char buffer[BUFFER_SIZE];
    while (fgets(buffer, BUFFER_SIZE, fp)) {
        printf("%s", buffer);
    }

    fclose(fp);
}

int main(int argc, char* argv[]) 
{
    if (argc == 1) {
        exit(0);
    }
    for (size_t i = 1; i < argc; i++)
    {
        single_cat(argv[i]);
    }
    
    return 0;
}