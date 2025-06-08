from setuptools import setup, Extension
from Cython.Build import cythonize
import os

gdal_include = os.popen("gdal-config --cflags").read().strip().replace("-I", "")
gdal_libs = os.popen("gdal-config --libs").read().strip().split()

ext_modules = [
    Extension(
        "gdalwrapper.gdal_info",
        sources=["gdalwrapper/gdal_info.pyx"],
        include_dirs=[gdal_include],
        libraries=["gdal"],
        extra_link_args=gdal_libs,
    )
]

setup(
    name="gdalWrapper",
    packages=["gdalwrapper"],
    ext_modules=cythonize(ext_modules),
    zip_safe=False,
)
