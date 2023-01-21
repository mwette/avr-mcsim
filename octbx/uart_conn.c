/* uart_conn.c
 *
 * Copyright (C) 2019,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#define _XOPEN_SOURCE 600
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
//#include <stdarg.h>
#include <stdio.h>
#include <assert.h>
//#include <time.h>
//#include <sys/types.h>
//#include <sys/stat.h>
//#include <fcntl.h>
//#include <unistd.h>

/* 
 * add option --tty=/dev/pts/xxx to connect to tty/pty
 * fd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
 * char buf[64], *p = ptsname(fd);
 * strcpy(buf, p); 
 * grantpt(fd)
 * unlockpt(fd)
 */

#include "uart_conn.h"

/* the FD should be set up as nonblocking */

char *conn_usart(usart_t *usart) {
  int fd, flags;
  char *ttyname;
  static char ttybuf[128];

  fd = open("/dev/ptmx", O_RDWR|O_NOCTTY);
  usart->tx_fd = usart->rx_fd = fd;
  ttyname = ptsname(fd);
  strcpy(ttybuf, ttyname);

  flags = fcntl(fd, F_GETFL, 0);
  fcntl(fd, F_SETFL, flags | O_NONBLOCK);
  grantpt(fd);
  unlockpt(fd);
  return ttybuf;
}

/* the FD should be set up as nonblocking */
void conn_output_file(usart_t *usart, char *filename) {
  usart->tx_fd = open(filename, O_WRONLY|O_CREAT|O_TRUNC, 0644);
}

void conn_input_file(usart_t *usart, char *filename) {
  usart->tx_fd = open(filename, O_RDONLY);
}

/* --- last line --- */
