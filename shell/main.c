#include <errno.h>
#include <locale.h>
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

int add_prefix(const char *prefix) {
  if (prefix == NULL) {
    return 0;
  }

  unsigned long len = strlen(prefix);
  wchar_t *wcs = malloc((len + 1) * sizeof(wchar_t));
  if (wcs == NULL) {
    return 1;
  }

  mbstate_t state = {0};
  size_t converted = mbsnrtowcs(wcs, &prefix, len, len, &state);
  if (converted == (size_t)-1) {
    return 1;
  }
  wcs[converted] = L'\0';

  fwprintf(stdout, wcs);
  free(wcs);
  return 0;
}

int main(int argc, char *argv[]) {
  char *prefix = NULL;
  if (argc != 2) {
    if (argc != 3) {
      fprintf(stderr, "Usage: <%s> logo_file", argv[0]);
      return EXIT_FAILURE;
    } else {
      prefix = argv[2];
    }
  }

  int terminal_width = get_terminal_width();
  if (terminal_width == -1) {
    fprintf(stderr, "Error opening the file: %s", strerror(errno));
    return EXIT_FAILURE;
  }

  FILE *file = fopen(argv[1], "r");
  if (file == NULL) {
    fprintf(stderr, "Error opening the file: %s", strerror(errno));
    return EXIT_FAILURE;
  }
  setlocale(LC_ALL, "");

  add_prefix(prefix);
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
