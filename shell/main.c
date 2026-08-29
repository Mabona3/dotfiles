#include <errno.h>
#include <locale.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <wchar.h>

#define BUFFER_SIZE 1024
wchar_t buffer[BUFFER_SIZE];

int get_terminal_width() {
    struct winsize win_size;
    int x = ioctl(STDOUT_FILENO, TIOCGWINSZ, &win_size);
    if (x == -1) {
        return -1;
    }

    return win_size.ws_col;
}

int main(int argc, char *argv[]) {
    int terminal_width = get_terminal_width();
    if (terminal_width == -1) {
        fprintf(stderr, "Error opening the file: %s", strerror(errno));
        return EXIT_FAILURE;
    }

    FILE *file = NULL;
    bool small = false;

    if (argc == 2 && strcmp(argv[1], "small") == 0) {
        small = true;
    }

    if (small == false && terminal_width >= 62)
        file = fopen("/home/mabona/dotfiles/shell/logo.txt", "r");
    else
        file = fopen("/home/mabona/dotfiles/shell/logo_sm.txt", "r");

    if (file == NULL) {
        fprintf(stderr, "Error opening the file: %s", strerror(errno));
        return EXIT_FAILURE;
    }
    setlocale(LC_ALL, "");

    while (fgetws(buffer, BUFFER_SIZE, file) != NULL) {
        long padding = (terminal_width - wcslen(buffer)) >> 1;
        wprintf(L"%*ls%ls", padding, L" ", buffer);
    }

    if (fclose(file) == EOF) {
        fprintf(stderr, "Error closing the file: %s", strerror(errno));
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
