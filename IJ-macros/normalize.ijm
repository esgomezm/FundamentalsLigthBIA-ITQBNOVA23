// clip the range of values to the [0,1] range
run("32-bit");
getStatistics(_, mean, min, max, std,_);
print("Mean value:"+mean)
print("Standard deviation value:"+std)
// mean normalization
run("Subtract...", "value="+min);
offset = max-min;
run("Divide...", "value="+offset);
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
setOption("ScaleConversions", true);
run("8-bit");