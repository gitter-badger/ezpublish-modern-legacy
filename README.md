# eZ Publish Legacy (4.x) Advanced

A drop in replacement for modern eZ Publish Legacy (4.x) projects.

## Why?

Having to ensure legacy support for eZ Publish 4, eZ System is very cautious
with changing the eZ Publish Legacy core (and rightfully so).

On the other hand, there are still projects based on the Legacy Core (and 
without Enterprise Support) out there which would benefit from an optimized
and enhanced code base.

## Goals

- Drop support for PHP 4.x
- Add additional functionality to ease extending the system
- Ensure existing functionality (all classes and methods must be preserved)
- Replace old-fashioned components with new ones (e.g. `eZCLI` with `symfony/console`) 
- Enhance code quality
- Enhance testability
