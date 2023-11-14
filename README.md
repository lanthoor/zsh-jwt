# zsh-jwt
A zsh plugin for fetching and decoding JWT tokens

This plugin provides a set of functions for fetching and decoding JWT tokens in zsh scripts.
It depends on the `jq` command-line JSON processor and `curl` command-line ReST client.

Usage:
1. Source this file in your zsh script: `source /path/to/zsh-jwt.plugin.zsh`
2. Call the `jwt` or `jwt_decode` functions with the token URL, client id, client secret.

Example:
```bash
source /path/to/zsh-jwt.plugin.zsh
jwt_decode https://auth.my.site.com/token client-id client-secret
```
