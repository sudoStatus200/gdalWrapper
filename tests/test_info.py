from gdalwrapper import gdal_info

def test_gdal_info():
    out = gdal_info("tests/data/sample.tif")  # Use a real raster file here
    assert "Driver" in out
