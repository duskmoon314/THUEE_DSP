# THUEE_DSP

Matlab source code for THUEE course Digital Signal Processing

## 文件说明

```
│  README.md
├─data
│  │  B3I_Codes.mat
│  │  ...
│
├─report
│  │  report.pdf
│  │  report.tex
│
└─src
        task2.m
        task3.m
        test.m
```

`src` 下为本次大作业的代码文件。其中 `test.m` 为任务一中设计并验证设计所用代码，有一定的注释。`task2.m` 和 `task3.m` 为任务二和任务三的代码，除了一些参数的不同外均一样。在 Matlab 中直接执行后面两个文件，会从 `data` 子文件夹下读取信号和伪随机码，处理后将捕获到的卫星编号和延时输出到控制台。

`report` 下为本次大作业的报告。

`data` 下为本次大作用中用到的数据文件。
