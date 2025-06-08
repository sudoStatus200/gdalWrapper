from gdal_info cimport GDALOpen, GDALClose, GDALInfo, GDALDatasetH, GDALAllRegister

def gdal_info(str filepath):
    cdef GDALDatasetH ds
    cdef const char* result
    cdef const char* path = filepath.encode('utf-8')

    GDALAllRegister()
    ds = GDALOpen(path, 0)  # GA_ReadOnly = 0
    if ds == NULL:
        raise RuntimeError("Failed to open dataset")

    result = GDALInfo(ds, NULL)
    GDALClose(ds)

    if result == NULL:
        raise RuntimeError("GDALInfo failed")

    return result.decode('utf-8')
