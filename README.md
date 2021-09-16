# Bazel build rules for [openssl](https://github.com/openssl/openssl)

Follows a "repos/deps" pattern (in order to help with recursive dependencies). To use:

1. Copy `bazel/repos.bzl` into your repository at `3rdparty/bazel-rules-openssl/repos.bzl` and add an empty `BUILD` (or `BUILD.bazel`) to `3rdparty/bazel-rules-openssl` as well.

2. Copy all of the directories from `3rdparty` that you ***don't*** already have in ***your*** repository's `3rdparty` directory.

3. Either ... add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

```bazel
load("//3rdparty/bazel-rules-openssl:repos.bzl", openssl_repos="repos")
openssl_repos()

load("@com_github_3rdparty_bazel_rules_openssl//bazel:deps.bzl", openssl_deps="deps")
openssl_deps()
```

Or ... to simplify others depending on ***your*** repository, add the following to your `repos.bzl`:

```bazel
load("//3rdparty/bazel-rules-openssl:repos.bzl", openssl_repos="repos")

def repos():
    openssl_repos()
```

And the following to your `deps.bzl`:

```bazel
load("@com_github_3rdparty_bazel_rules_openssl//bazel:deps.bzl", openssl_deps="deps")

def deps():
    openssl_deps()
```

4. You can then use `@openssl` in your target's `deps`.

5. Repeat the steps starting at (1) at the desired version of this repository that you want to use:

| openssl | Copy `bazel/repos.bzl` from: |
| :---: | :--------------------------: |
| 1.1.1k | [130bda8](https://github.com/3rdparty/bazel-rules-openssl/tree/130bda8037113ea4295fb35e0bd502d7c44727eb) |
