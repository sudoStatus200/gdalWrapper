# gdal_info.pyx

from gdal_info cimport GDALOpen, GDALClose, GDALInfo, GDALDatasetH, GDALAllRegister
from libc.string cimport strdup
from cpython.bytes cimport PyBytes_FromString

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
