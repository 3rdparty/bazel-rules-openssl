load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def repos(external = True, repo_mapping = {}):
    maybe(
        http_archive,
        name = "rules_foreign_cc",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.5.1.tar.gz",
        sha256 = "33a5690733c5cc2ede39cb62ebf89e751f2448e27f20c8b2fbbc7d136b166804",
        strip_prefix = "rules_foreign_cc-0.5.1",
        repo_mapping = repo_mapping,
     )

    if external:
        maybe(
            git_repository,
            name = "com_github_3rdparty_bazel_rules_openssl",
            remote = "https://github.com/3rdparty/bazel-rules-openssl",
            commit = "f425c04e5d90eae38ad023e095d3108439c05875",
            shallow_since = "1631192327 +0200",
            repo_mapping = repo_mapping,
        )
