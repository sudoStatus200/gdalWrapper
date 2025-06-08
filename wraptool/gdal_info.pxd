# gdal_info.pxd

from libc.stdint cimport int64_t
from libc.stdio cimport FILE

cdef extern from "gdal.h":
    ctypedef void* GDALDatasetH

    GDALDatasetH GDALOpen(const char *filename, int access)
    void GDALClose(GDALDatasetH dataset)

    const char* GDALInfo(GDALDatasetH hDataset, void* options)

    void GDALAllRegister()
