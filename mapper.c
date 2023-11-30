//
// Created by Sokhibjon Orzikulov on 30/11/23.
//

#include "mapper.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Redirect *parse_redirects(const char *file_name) {
  FILE *file = fopen(file_name, "r");
  char line[MAX_LINE_LENGTH];
  Redirect *head = NULL, *current = NULL;

  if (file == NULL) {
    perror("Error opening file");
    return NULL;
  }

  while (fgets(line, sizeof(line), file)) {
    char *key = strtok(line, "=");
    char *url = strtok(NULL, "\n");

    if (key && url) {
      Redirect *new_redirect = malloc(sizeof(Redirect));
      new_redirect->key = strdup(key);
      new_redirect->url = strdup(url);
      new_redirect->next = NULL;

      if (head == NULL) {
        head = new_redirect;
      } else {
        current->next = new_redirect;
      }
      current = new_redirect;
    }
  }

  fclose(file);
  return head;
}