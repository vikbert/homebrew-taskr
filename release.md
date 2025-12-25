
## How to update tap

使用 Taskfile.yml 中的任务来管理公式更新：

```bash
# 查看所有任务
taskr --list

# 更新到新版本（注意：需要使用 -- 分隔符）
taskr update -- 3.47.7

# 验证更改
taskr verify

# 提交更改
taskr commit

# 测试安装
taskr test

# 查看当前版本
taskr version

# 检查状态
taskr status

# 完整发布流程（注意：需要使用 -- 分隔符）
taskr release -- 3.47.7
```

**重要提示：** 当传递版本号参数时，必须使用 `--` 分隔符，因为 Task 会将包含点号的版本号误认为是任务名。

