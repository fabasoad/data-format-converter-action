# FAQ

## What if `from` and `to` are the same?

There will not be error or any exception in this case. Resulting target file
will be just a copy of the source file in this case.

## I have "API rate limit exceeded" error

You need to pass GitHub token to the `github-token` parameter of the action in
case you have error message below.

```text
Error: API rate limit exceeded for <IP>. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)
```
