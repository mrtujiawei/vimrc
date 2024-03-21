# TMUX

client -> session -> window -> session

client: 不同终端中使用 tmux 会有不同的 client

## 默人快捷键

> 前缀键 `<C-b>`

- `<C-o>`: 逆时针切换当前光标下的 pane
- `!`: 当前 pane 单独开一个 window
- `"`: 上下分割窗口
- `%`: 左右分割窗口
- `'`: 切换 window
- `$`: 重命名当前 session
- `,`: 重命名当前 window
- `&`: 关闭当前 window
- `(`: 切换到前一个 session
- `)`: 切换到后一个 session
- `.`: 移动到另一个没有使用的 window
- `:`: 输入命令
- `;`: 切换到上一个活跃的 pane
- `?`: 显示所有快捷键
- `D`: 断开某个 client 的连接，需要在多个终端中使用 tmux
- `L`: 切换到上一个 session
- `[`: 进入 copy 模式
- `]`: 粘贴
- `f`: 过滤 window 并选择
- `i`: 显示当前 window 信息
- `l`: 切换 window
- `m`: 标记当前 pane
- `M`: 清楚当前 pane 标记
- `n`: 切换到下一个 window
- `p`: 切换到上一个 window
- `o`: 选择下一个 pane
- `q`: 显示 pane 索引
- `r`: 强制重回当前 client -> 自定义成 重新加载配置文件
- `s`: 选择一个新会话
- `t`: 显示时间
- `w`: 选择 window
- `x`: 关闭当前 pane
- `{`: pane 位置切换
- `}`: pane 位置切换
- `~`: 显示之前的消息
- `space`: 预设布局切换


### 尝试

- `z`: 恢复缩放

### 无效

- `-`: 删除最近复制的内容 => 删不掉
- `=`: 选择需要复制的内容 => 选了不生效
