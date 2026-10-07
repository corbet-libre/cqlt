# Sourced by our CI scripts. First-party dependency manifests at older pinned
# commits may still name github.com; resolve them from the canonical Forgejo.
export CARGO_NET_GIT_FETCH_WITH_CLI=true
if [ -z "${CMTY_FORGE_FETCH_SET:-}" ]; then
  export CMTY_FORGE_FETCH_SET=1
  for org in corbet-foss corbet-libs corbet-labs cmtymeet; do
    n=${GIT_CONFIG_COUNT:-0}
    export "GIT_CONFIG_KEY_$n=url.https://git.corbet.ch/$org/.insteadOf"
    export "GIT_CONFIG_VALUE_$n=https://github.com/$org/"
    export GIT_CONFIG_COUNT=$((n + 1))
  done
fi
