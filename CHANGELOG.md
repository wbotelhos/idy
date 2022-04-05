## v1.1.0

### Updates

- Does not restrict Rails version;
- Does not restrict Hashids version;
- Bump Ruby version to 2.6.4;

## v1.0.0

### Break Changes

- Drops `find` override method to avoid finding on a hash that looks like a number issue [#1](https://github.com/wbotelhos/idy/issues/1)

## v0.1.3

### Features

- Added `find` method to find directly via idy returning `nil` when the record is not found;
- Added `find!` method to find directly via idy raising an error when the record is not found.

### Fixes

- String that is integer-like is not passed to the original find method.

## v0.1.2

### Fixes

- Set options on a prefixed var to avoid conflict.

## v0.1.1

### Fixes

- v0.1.0 had a problem with `push`.

## v0.1.0

- First release.
