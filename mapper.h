//
// Created by Sokhibjon Orzikulov on 30/11/23.
//

#ifndef NEKO_MAPPER_H
#define NEKO_MAPPER_H

#define MAX_LINE_LENGTH 1024

typedef struct Redirect {
  char *key;
  char *url;
  struct Redirect *next;
} Redirect;

Redirect *parse_redirects(const char *file_name);

#endif//NEKO_MAPPER_H
