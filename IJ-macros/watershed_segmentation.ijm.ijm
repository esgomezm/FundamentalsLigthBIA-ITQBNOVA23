// Threshold the inner part of the bacteria cells that will represent the markers.
run("Duplicate...", "title=markers");
setThreshold(1, 1, "raw");
setOption("BlackBackground", true);
run("Convert to Mask");

// Threshold the binary image corresponding to the bacteria cells.
selectWindow("test_10.tif");
setAutoThreshold("Default dark");
setThreshold(1, 2, "raw");
setOption("BlackBackground", true);
run("Convert to Mask");

// Marker controlled watershed.
run("Marker-controlled Watershed", "input=test_10.tif marker=markers mask=test_10.tif compactness=0 binary calculate use");
