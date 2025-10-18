#include <stdio.h>
#include "miniaudio.h"

int main()
{
  printf("UInt32: %zu\n", sizeof(unsigned int));
  printf("size_t: %zu\n", sizeof(size_t));
  printf("ma_data_converter: %zu\n", sizeof(ma_data_converter));
  printf("ma_context: %zu\n", sizeof(ma_context));
  printf("ma_device: %zu\n", sizeof(ma_device));
  printf("ma_mutex: %zu\n", sizeof(ma_mutex));
  return 0;
}
