# eZ Publish Modern Legacy (ML)

A drop in replacement for modern 
[eZ Publish Legacy (4.x)](https://github.com/ezsystems/ezpublish-legacy) projects.

[![Build Status](https://travis-ci.org/jeromegamez/ezpublish-modern-legacy.svg?branch=master)](https://travis-ci.org/jeromegamez/ezpublish-modern-legacy)

## Why?

As eZ Systems is pushing towards the new eZ Platform (which, in the end,
will drop support for eZ Publish Legacy), changes to the old eZ Publish 
are limited to a needed minimum, so that new features or changes absolutely
needed to ensure a working eZ Publish 5.x/Platform.

But let's face it: there are still some pure eZ 4.x projects out there which
need to be maintained, eZ Publish 5 relies on Legacy, and in the current state,
eZ Platform does as well - so the legacy core will stay around for a while. 

eZ Publish ML is for developers who want or have to rely on the "old" stack,
but still would like to benefit from improvements and perhaps even new
features.

## Goals

- Drop support for PHP <5.3 (PHP 5.4 is the oldest supported PHP version,
  so eZ Publish ML will not settle for less :))
- Apply Pull Requests that didn't make it into the original eZ Publish Legacy
- Add additional functionality to ease usage and further improvements
- Ensure existing functionality (all classes and methods must be preserved)
- Replace components state of the art ones (e.g. `eZLog` with `psr/log`) 
- Enhance code quality
- Enhance testability

Have a look at the [changelog](CHANGELOG.md) to see what is different from the
official eZ Systems release.

## Important notes

- The releases of eZ Publish ML will always be based on the master branch of the
  official eZ Publish Repository.
- This project is not affiliated to, supported or endorsed by eZ Systems or my
  current employer (yet :)).
- If you chose to replace an Enterprise Edition of eZ Publish Legacy with
  eZ Publish ML, expect to lose your enterprise support.
- Obviously, if you use classes and methods from the `eZ\ModernLegacy` namespace
  in your custom extensions, you will not be able to drop out of eZ Publish ML
  again.
  
## Installation

### Clean legacy installation

```bash
$ composer create-project jeromegamez/ezpublish-modern-legacy my_project
```

### Clean eZ Publish 5 Community installation

```bash
$ composer create-project --no-install ezsystems/ezpublish-community my_project
$ cd my_project
$ composer require --no-update jeromegamez/ezpublish-modern-legacy
$ composer install
```

### Using eZ Publish ML in your existing eZ Publish Community project

If you have custom code inside your `ezpublish_legacy` folder, create a backup 
of it first.  
  
```bash
$ rm -rf {ezpublish_legacy,vendor}
$ composer require jeromegamez/ezpublish-modern-legacy
```

Then, copy back your custom code into the newly created `ezpublish_legacy`
folder.

