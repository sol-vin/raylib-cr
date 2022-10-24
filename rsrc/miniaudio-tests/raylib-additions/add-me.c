
// raylib.h
RLAPI size_t MADataConverterSize();
RLAPI size_t MAContextSize();
RLAPI size_t MADeviceSize();
RLAPI size_t MAMutexSize();

//raudio.c
size_t MADataConverterSize() {
return sizeof(ma_data_converter);
}

size_t MAContextSize() {
return sizeof(ma_context);
}

size_t MADeviceSize() {
return sizeof(ma_device);
}

size_t MAMutexSize() {
return sizeof(ma_mutex);
}