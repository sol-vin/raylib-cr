#include <stdio.h>

#define MINIAUDIO_IMPLEMENTATION
#include "include/miniaudio.h"

int main()
{
  printf("size_t: %d", sizeof(size_t));
  printf("ma_data_converter: %d", sizeof(ma_data_converter));
  printf("ma_context: %d", sizeof(ma_context));
  printf("ma_device: %d", sizeof(ma_device));
  printf("ma_mutex: %d", sizeof(ma_mutex));
}
