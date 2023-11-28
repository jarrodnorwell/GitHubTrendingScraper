# GitHubTrendingScraper
GitHubTrendingScraper is a middleman of GitHubTrending, built using SwiftSoup and written entirely in Swift, GitHubTrendingScraper handles all of the data scraping from GitHub and uploading to GitHubTrendingAPI

## Prerequisites
### Frameworks
- **[GitHubTrendingAPI](https://github.com/jarrodnorwell/GitHubTrendingAPI)**

### Operating System
- Linux (preferred)
- macOS
- Linux on Windows with **[WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)**

## Getting Started
### Change Directory
```bash
$ cd /path/to/directory
```

### Clone Repository
```bash
$ git clone https://github.com/jarrodnorwell/GitHubTrendingScraper
```

### Change Directory, Build & Run
```bash
$ cd GitHubTrendingScraper
$ swift build -c release
$ .build/release/GitHubTrendingScraper
```

## Final Notes
Once GitHubTrendingScraper has been run, open **[127.0.0.1:8080](http://127.0.0.1:8080)**