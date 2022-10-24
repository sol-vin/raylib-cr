#include <stdio.h>

#define MINIAUDIO_IMPLEMENTATION
#include "include/miniaudio.h"

int main()
{
  printf("UInt32: %d\n", sizeof(unsigned int));
  printf("size_t: %d\n", sizeof(size_t));
  printf("ma_data_converter: %d\n", sizeof(ma_data_converter));
  printf("ma_context: %d\n", sizeof(ma_context));
  printf("ma_device: %d\n", sizeof(ma_device));
  printf("ma_mutex: %d\n", sizeof(ma_mutex));
}
