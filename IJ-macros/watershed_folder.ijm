input = getDirectory("Choose the folder containing the images");
list_files = getFileList(input);
output = "/Users/esti/Documents/instance-segmentation/output";
File.makeDirectory(output);

for (i = 0; i < list_files.length; i++) {
	current_file = list_files[i];
	path_current = input + File.separator + current_file;
	if (endsWith(current_file, ".tif")) {
		open(path_current);
		// Threshold the inner part of the bacteria cells that will represent the markers.
		run("Duplicate...", "title=markers");
		setThreshold(1, 1, "raw");
		setOption("BlackBackground", true);
		run("Convert to Mask");
		
		// Threshold the binary image corresponding to the bacteria cells.
		selectWindow(current_file);
		setThreshold(1, 2, "raw");
		setOption("BlackBackground", true);
		run("Convert to Mask");
		
		// Marker controlled watershed.
run("Marker-controlled Watershed", "input=" + current_file + " marker=markers mask=" + current_file + " compactness=0 binary calculate use");
		saveAs("Tiff", output + File.separator + current_file);
		run("Close All");
	}
}
