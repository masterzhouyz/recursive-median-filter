# Introduction
Recursive median filter Verilog build library. It includes two window sizes of 3×3 and 5×5. The hardware platform used in this project is Xilinx ynq UltraScale+ xczu9eg-ffvb1156-2-e.
# Modules
## 3×3 Window size
* `top.v` -- 3×3 window top module.
* `select5_3.v` -- 3x3 window pre-processing module. Exclude the maximum and minimum values in the last two columns of the current window (window center data does not participate in pre-processing).
* `sort7.v` -- 3×3 window median calculation module. The median is calculated using the preprocessed data from the previous window and the newly added data from the current window.
## 5×5 Window size
* `top.v` -- 5×5 window top module.
* `select19_5.v` -- 5x5 window pre-processing module. Exclude the seven largest and seven smallest values in the last four columns of the current window (window center data does not participate in pre-processing).
* `sort11.v` -- 5×5 window median calculation module. The median is calculated using the preprocessed data from the previous window and the newly added data from the current window.
