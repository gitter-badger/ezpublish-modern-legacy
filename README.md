# eZ Publish Modern Legacy (4.x)

A drop in replacement for modern eZ Publish Legacy (4.x) projects.

## Why?

As eZ Systems is pushing towards the new eZ Platform (which, in the end,
will drop support for eZ Publish Legacy, changes to the old eZ Publish 
are limited to a needed minimum and 

On the other hand, there are still projects based on the Legacy Core (and 
without Enterprise Support) out there which would benefit from an optimized
and enhanced code base.

## Goals

- Drop support for PHP 4.x
- Apply Pull Requests that didn't make it into the original eZ Publish Legacy
  - This is done by cherry-picking the commits from the pull requests
- Add additional functionality to ease extending the system
- Ensure existing functionality (all classes and methods must be preserved)
- Replace old-fashioned components with new ones (e.g. `eZCLI` with `symfony/console`) 
- Enhance code quality
- Enhance testability
