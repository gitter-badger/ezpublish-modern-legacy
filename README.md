# eZ Publish Modern Legacy (ML)

A drop in replacement for modern 
[eZ Publish Legacy (4.x)](https://github.com/ezsystems/ezpublish-legacy) projects.

## Why?

As eZ Systems is pushing towards the new eZ Platform (which, in the end,
will drop support for eZ Publish Legacy, changes to the old eZ Publish 
are limited to a needed minimum, so that new features or changes absolutely
needed to ensure a working eZ Publish 5.x/Platform.

On the other hand, there are still projects based on the Legacy Core (and 
without Enterprise Support) out there which would benefit from ongoing
enhancements.

## Goals

- Drop support for PHP <5.3
  - PHP 5.4 is the oldest supported PHP version, so eZ Publish ML will not settle
    for less :)
- Apply Pull Requests that didn't make it into the original eZ Publish Legacy
  - This is done by cherry-picking the commits from the pull requests
- Add additional functionality to ease extending the system
- Ensure existing functionality (all classes and methods must be preserved)
- Replace old-fashioned components with new ones (e.g. `eZCLI` with `symfony/console`) 
- Enhance code quality
- Enhance testability

Have a look at the [changelog](CHANGELOG.md) to see what is different from the
official eZ Systems release.

## Important notes

- The releases of eZ Publish ML will always be based on the master branch of the
  official eZ Publish Repository.
- If you chose to replace an Enterprise Edition of eZ Publish Legacy with
  eZ Publish ML, expect to lose your enterprise support. 
  
## Installation

```bash
composer create-project jeromegamez/ezpublish-modern-legacy my_project
```

From there, please refer to the
[official eZ Publish Legacy documentation](https://doc.ez.no/eZ-Publish/).