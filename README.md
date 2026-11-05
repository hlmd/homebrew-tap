# hlmd 的 Homebrew tap

[redis-insight-chinese](https://github.com/hlmd/redis-insight-chinese)（Redis Insight 桌面端非官方中文本地化工具，支持简体中文与繁體中文）的 Homebrew 安装源，支持 macOS 与 Linux（x64 / arm64）。

```bash
brew install hlmd/tap/redis-insight-chinese

redis-insight-chinese            # 注入翻译（先完全退出 Redis Insight；繁体加 --lang zh-TW）
redis-insight-chinese restore    # 还原英文
brew upgrade redis-insight-chinese
```

`Formula/` 下的配方由主仓库发版时的 GitHub Actions 自动更新，请勿手改。

> 非官方项目，与 Redis Ltd. 无关；"Redis" 与 "Redis Insight" 是其商标。
