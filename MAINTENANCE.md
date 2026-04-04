# AstroNvim-config Maintenance Notes

这份文件是给未来的自己看的。

目标：

- 半年到一年后回来维护时，不需要重新理解整个 AstroNvim 生态
- 只靠基础 `git` 知识，也能知道这个仓库该怎么更新
- 尽量保留自己的 commit history，以及上游 `AstroNvim/template` 的 commit hash

## 最短版本

如果你将来什么都忘了，只记住这个：

- 这个仓库有两个 remote：
  - `origin` 是你自己的 fork
  - `upstream` 是官方 `AstroNvim/template`
- 下面这组命令的目的只有一件事：
  - 把官方模板的新提交 merge 到你自己的 `main`，然后再推回自己的 fork
- 如果你更习惯 `lazygit`，也可以按同样顺序做；这里放命令只是为了明确“实际发生了什么”

```bash
cd ~/.config/nvim          # 进入这个配置仓库
git fetch upstream         # 取回官方模板的最新提交
git switch main            # 确保当前在自己的主分支
git merge upstream/main    # 把上游提交 merge 进来，保留双方历史
git push origin main       # 把 merge 结果推回自己的 fork
```

如果冲突了：

```bash
git status
git merge --abort
```

先退出，再慢慢看，不要硬推。

## 仓库关系

- GitHub 仓库：`haozihong/AstroNvim-config`
- 这个仓库是从 `AstroNvim/template` 创建的 fork
- 本地主分支：`main`
- `origin` 指向自己的 GitHub fork
- `upstream` 指向官方模板仓库 `AstroNvim/template`

可用下面命令确认：

```bash
git remote -v
git branch -vv
```

理想状态应该类似：

```bash
origin   git@github.com:haozihong/AstroNvim-config.git
upstream git@github.com:AstroNvim/template.git
```

## 维护原则

- 平时只在 `main` 上维护
- 不追模板的每一次小改动
- 只有在这些时候才同步上游：
  - AstroNvim 大版本升级
  - 现有配置失效
  - 想参考官方新的推荐写法
- 同步上游时优先用 `merge`，不要默认用 `rebase`
- 如果一切都能正常用，而且没有明确需求，不要为了“追新”而更新
- 不要为了“历史更直”去 rebase
- 不要大规模重构配置结构

为什么用 `merge`：

- 能保留自己的提交历史
- 能保留上游原始 commit hash
- 对这种配置仓库更稳，更容易回头看

## 这个仓库里哪些文件最值得优先看

- `lua/plugins/user.lua`
- `lua/plugins/astrocore.lua`
- `lua/plugins/astrolsp.lua`
- `lua/plugins/treesitter.lua`
- `lua/polish.lua`

这些地方包含了大部分个人定制。

## 细节和排查

### 更新前先看差异

如果想先看看上游改了多少，再决定要不要 merge：

```bash
git fetch upstream
git log --oneline --left-right --graph main...upstream/main
git diff --stat main...upstream/main
```

理解方式：

- 左边是自己的提交
- 右边是上游的提交
- `diff --stat` 可以快速看这次主要改了哪些文件

### 如果 merge 有冲突

先看状态：

```bash
git status
```

然后：

1. 打开冲突文件
2. 手工解决冲突
3. `git add <文件>`
4. 全部解决后执行：

```bash
git commit
git push origin main
```

如果你发现自己已经搞乱了，但还没 commit，可以放弃这次 merge：

```bash
git merge --abort
```

### 不确定默认值时怎么查

先查插件自己的默认配置，再查 AstroNvim 有没有覆盖。

例如查 `neo-tree` 的 `group_empty_dirs`：

```bash
rg -n "group_empty_dirs" ~/.local/share/nvim/lazy -g '*.lua'
```

经验规则：

- 先看插件自己的 `defaults.lua`
- 再看 AstroNvim 对这个插件的封装文件
- 最后再看自己的 `lua/plugins/*.lua`
