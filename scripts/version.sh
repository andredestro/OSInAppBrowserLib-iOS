#!/bin/bash
# version.sh: Centraliza operações de versionamento do projeto iOS
# Uso:
#   ./scripts/version.sh bump [patch|minor|major]
#   ./scripts/version.sh get
#   ./scripts/version.sh changelog
set -e

PBXPROJ="OSInAppBrowserLib.xcodeproj/project.pbxproj"

case "$1" in
  bump)
    BUMP_TYPE="${2:-patch}"
    # Extrai versão atual
    current_version=$(grep -m1 'MARKETING_VERSION =' "$PBXPROJ" | sed -E 's/.*MARKETING_VERSION = ([0-9]+\.[0-9]+\.[0-9]+);/\1/')
    IFS='.' read -r major minor patch <<< "$current_version"
    case "$BUMP_TYPE" in
      major)
        major=$((major+1)); minor=0; patch=0;;
      minor)
        minor=$((minor+1)); patch=0;;
      *)
        patch=$((patch+1));;
    esac
    new_version="$major.$minor.$patch"
    # Atualiza MARKETING_VERSION
    sed -i '' -E "s/MARKETING_VERSION = [0-9]+\.[0-9]+\.[0-9]+;/MARKETING_VERSION = $new_version;/g" "$PBXPROJ"
    # Atualiza CURRENT_PROJECT_VERSION
    current_proj_version=$(grep -m1 'CURRENT_PROJECT_VERSION =' "$PBXPROJ" | sed -E 's/.*CURRENT_PROJECT_VERSION = ([0-9]+);/\1/')
    new_proj_version=$((current_proj_version+1))
    sed -i '' -E "s/CURRENT_PROJECT_VERSION = [0-9]+;/CURRENT_PROJECT_VERSION = $new_proj_version;/g" "$PBXPROJ"
    echo "Bumped MARKETING_VERSION to $new_version, CURRENT_PROJECT_VERSION to $new_proj_version"
    ;;
  get)
    grep -m1 'MARKETING_VERSION =' "$PBXPROJ" | sed -E 's/.*MARKETING_VERSION = ([0-9]+\.[0-9]+\.[0-9]+);/\1/'
    ;;
  changelog)
    VERSION=$(grep -m1 'MARKETING_VERSION =' "$PBXPROJ" | sed -E 's/.*MARKETING_VERSION = ([0-9]+\.[0-9]+\.[0-9]+);/\1/')
    TODAY=$(date +%Y-%m-%d)
    CHANGELOG="docs/CHANGELOG.md"
    awk -v ver="$VERSION" -v today="$TODAY" '
      BEGIN { unreleased_found=0 }
      /^## \[Unreleased\]/ {
        print $0; print ""; print "## [" ver "] - " today; unreleased_found=1; next
      }
      { print $0 }
    ' "$CHANGELOG" > "$CHANGELOG.tmp" && mv "$CHANGELOG.tmp" "$CHANGELOG"
    echo "CHANGELOG updated for version $VERSION"
    ;;
  *)
    echo "Uso: $0 bump [patch|minor|major] | get | changelog"
    exit 1
    ;;
esac
