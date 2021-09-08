#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void single_grep(char* search_word, char* file_name, bool multiple_file) 
{
    FILE* fp = fopen(file_name, "r");
    if (fp == NULL) {
        printf("wgrep: cannot open file: %s\n", file_name);
        exit(1);
    }

    char * line = NULL;
    size_t len = 0;
    ssize_t read;

    char* prefix = multiple_file ? strcat(strdup(file_name), ":") : "";
    while ((read = getline(&line, &len, fp)) != -1) {
        char* ret = strstr(line, search_word);
        if (ret)
            printf("%s%s", prefix, line);
    }

    fclose(fp);
}

int main(int argc, char* argv[]) 
{
    if (argc == 1) {
        exit(0);
    } else if (argc == 2) {
        printf("Please enter file name...");
        exit(0);
    }
    
    bool multiple_file = argc > 3;
    for (size_t i = 2; i < argc; i++)
    {
        single_grep(argv[1], argv[i], multiple_file);
    }
    
    return 0;
}
