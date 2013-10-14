# CHANGELOG

## Unreleased

This release is based on [5908d5ee65](https://github.com/ezsystems/ezpublish-legacy/commit/5908d5ee65)
of the master branch from the official eZ Publish Legacy repository.

* Prepare support for PHP 7.0 and HHVM by adding them to the Travis CI build
  matrix (as allowed to fail).
* Pull Requests from the official repository
  * **[#738](https://github.com/ezsystems/ezpublish-legacy/pull/738) Ensure database connection for tests**  
    Makes sure that a database connection is set when running the test suite
    (this applies to tests in extensions)
  * **[#787](https://github.com/ezsystems/ezpublish-legacy/pull/787) Change constants to strings in array keys**  
    Replaces occurences of `$array[constant]` to `$array['key']`.
  * **[#809](https://github.com/ezsystems/ezpublish-legacy/pull/809) Added or replaced meaningful label for eZDebug messages**  
    Instead of using hardcoded labels for debug messages, `__METHOD__` is
    used to make it easier to locate the code that triggered a message.
  * **[#813](https://github.com/ezsystems/ezpublish-legacy/pull/813) Make eZPaymentLogger use eZLog** 
    Replaces the custom logging implementation of the eZPaymentGateway with
    the usage of the core `eZLog` component.


## 1.0 - 2015-05-14

This release is based on [5908d5ee65](https://github.com/ezsystems/ezpublish-legacy/commit/5908d5ee65)
of the master branch from the official eZ Publish Legacy repository.

* Bumped lowest PHP version to 5.4.8
* Updated PHPUnit to ~4.6
* Pull Requests from the official repository
  * **[#1170](https://github.com/ezsystems/ezpublish-legacy/pull/1170) Fix trimming DOMElement textContent properties (re-enables PHP 5.6 on Travis)**
    Ensures that 

