# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Features

- Add support for passing custom headers to `WKWebView` (only for the openInWebView option). [RMET-4287](https://outsystemsrd.atlassian.net/browse/RMET-4287).

## 2.0.1

### Features

- Added support for back and forward swipe navigation gestures in `WKWebView` via the `allowsBackForwardNavigationGestures` option. (for openInWebView option only) (https://outsystemsrd.atlassian.net/browse/RMET-4216).

## 2.0.0

### Features

- Users now receive an event when the navigation occurs (for openInWebView option only) (https://outsystemsrd.atlassian.net/browse/RMET-4122).

### Fixes

- **BREAKING:** Fix an issue where the application freezes when 'OpenInExternalBrowser' is called

## 1.0.0

### Features
- Add custom error page for `OpenInWebView` feature (https://outsystemsrd.atlassian.net/browse/RMET-3491).
- Add `Close` feature (https://outsystemsrd.atlassian.net/browse/RMET-3427).
- Add `OpenInWebView`'s interface customisations (https://outsystemsrd.atlassian.net/browse/RMET-3489).
- Add `OpenInWebView`'s event listeners (https://outsystemsrd.atlassian.net/browse/RMET-3430).
- Add `OpenInWebView`'s features (https://outsystemsrd.atlassian.net/browse/RMET-3425).
- Add `OpenInSystemBrowser`'s event listeners (https://outsystemsrd.atlassian.net/browse/RMET-3429).
- Add `OpenInSystemBrowser`'s features (https://outsystemsrd.atlassian.net/browse/RMET-3423).
- Add `OpenInExternalBrowser` (https://outsystemsrd.atlassian.net/browse/RMET-3421).

### Chores
- Create `podspec` to enable CocoaPods publish (https://outsystemsrd.atlassian.net/browse/RMET-3578).
- Add content to `README` (https://outsystemsrd.atlassian.net/browse/RMET-3473).
