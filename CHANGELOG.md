## v1.0.0

- News
 - Drops overrided `find` method to avoid find on a hash that looks like a number issue [#1](https://github.com/wbotelhos/idy/issues/1)

## v0.1.3

- features
  - Added `find` method to find directly via idy returning `nil` when record is not found;
  - Added `find!` method to find directly via idy raising error when record is not found.

- bug fixes
  - String that is integer like is not passed to original find method.

## v0.1.2

- bug fixes
  - Set options on a prefixed var to avoid conflict.

## v0.1.1

- bug fixes
  - v0.1.0 had problem on `push`.

## v0.1.0

- First release.
