#include <stdio.h>

#include "miniaudiohelpers.h"

int main()
{
  printf("UInt32: %d\n", sizeof(unsigned int));
  printf("size_t: %d\n", sizeof(size_t));
  printf("ma_data_converter: %d\n", MADataConverterSize());
  printf("ma_context: %d\n", MAContextSize());
  printf("ma_device: %d\n", MADeviceSize());
  printf("ma_mutex: %d\n", MAMutexSize());
}
