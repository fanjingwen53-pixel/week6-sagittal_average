#!/bin/bash
# 自动测试 sagittal_brain.py 的正确性

# 删除旧的输出文件（避免干扰）
rm -f brain_average.csv

# 运行你的 Python 程序
python sagittal_brain.py

# 检查结果文件是否生成
if [ ! -f brain_average.csv ]; then
    echo "BAD - no output file"
    exit 1
fi

# 判断结果是否合理
# （这里我们假设正确情况下最后一行应该包含 “1”）
if tail -n 1 brain_average.csv | grep -q "1"; then
    echo "GOOD"
    exit 0   # 程序正确
else
    echo "BAD"
    exit 1   # 程序错误
fi