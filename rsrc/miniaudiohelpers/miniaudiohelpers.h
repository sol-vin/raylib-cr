#include "miniaudio.h"

size_t MADataConverterSize();
size_t MAContextSize();
size_t MADeviceSize();
size_t MAMutexSize();

size_t MADataConverterSize()
{
  return sizeof(ma_data_converter);
}

size_t MAContextSize()
{
  return sizeof(ma_context);
}

size_t MADeviceSize()
{
  return sizeof(ma_device);
}

size_t MAMutexSize()
{
  return sizeof(ma_mutex);
}