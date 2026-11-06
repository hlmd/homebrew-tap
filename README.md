# hlmd 的 Homebrew tap

hlmd 系列桌面端非官方中文本地化工具的 Homebrew 安装源，支持 macOS 与 Linux（x64 / arm64）。

| Formula | 说明 |
|---------|------|
| [redis-insight-chinese](https://github.com/hlmd/redis-insight-chinese) | Redis Insight 桌面端非官方中文本地化工具，支持简体中文与繁體中文 |
| [postman-chinese-injector](https://github.com/hlmd/postman-chinese-injector) | Postman 桌面端非官方汉化工具 |

### redis-insight-chinese

```bash
brew install hlmd/tap/redis-insight-chinese

redis-insight-chinese            # 注入翻译（先完全退出 Redis Insight；繁体加 --lang zh-TW）
redis-insight-chinese restore    # 还原英文
brew upgrade redis-insight-chinese
```

### postman-chinese-injector

```bash
brew install hlmd/tap/postman-chinese-injector

postman-chinese-injector              # 注入汉化（先完全退出 Postman）
postman-chinese-injector --restore    # 还原英文
brew upgrade postman-chinese-injector
```

`Formula/` 下的配方由主仓库发版时的 GitHub Actions 自动更新，请勿手改。

> 非官方项目，与 Redis Ltd.、Postman, Inc. 无关；"Redis"、"Redis Insight"、"Postman" 是各自所有者的商标。
