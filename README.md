# Idy

[![CI](https://github.com/wbotelhos/idy/workflows/CI/badge.svg)](https://github.com/wbotelhos/idy/actions?query=workflow:CI)
[![Gem Version](https://badge.fury.io/rb/idy.svg)](https://badge.fury.io/rb/idy)

An ID obfuscator for ActiveRecord.

## Description

Do not let your users knows about your IDs:

- IDs can make hacker's life easier for a sequential attack;
- IDs can make crawler's life easier for a sequential scan;
- With few records on your database it can seem that your business is weak;
- With many records on your database it can call attention of people.

*Make it clean, make it lean, make it hidden.*

`http://example.com/articles/1` -> `http://example.com/articles/My`

It uses [Hashids](http://hashids.org/ruby) to make it pretty.

## install

Add the following code on your `Gemfile` and run `bundle install`:

```ruby
gem 'idy'
```

## Usage

On an `ActiveRecord` model, just add `idy` callback:

```ruby
class Article < ApplicationRecord
  idy
end
```

Try to call on your model the obfuscated ID:

```ruby
Article.new(id: 1).idy
# My
```

It will build your Rails URL with that ID too:

```ruby
Article.new(id: 1).to_param
# localhost:3000/articles/My
```

## Security

Idy is not for encryption, it is about obfuscation.
If you want a *unbreakable* hash, it is not for you.

## Collision

To avoid two differents models to generates the same hash for the same ID,
by default, the class name is used as a [Salt](https://en.wikipedia.org/wiki/Salt_cryptography).

```ruby
Article.new(id: 1).idy
# My

User.new(id: 1).idy
# ex
```

## Salt

You can provide you own:

```ruby
class Article < ApplicationRecord
  idy salt: 's3cr3t'
end
```

```ruby
Article.new(id: 1).idy
# 9A
```

## Idy

As you could see, the method `idy`, returns the hash representation of your ID:

```ruby
Article.new(id: 1).idy
# My
```

If you want get all idys from a collection, just map it:

```ruby
Article.create
Article.create

Article.select(:id).map(&:idy)
# ["My", "aL"]
```

## Find

Since you add the `idy` callback to your model, `find` method will be decorated:

```ruby
Article.find('My').id
# 1
```

Keep in mind that if you have some internal code, that you cannot change,
using `find`, the hash version of the id, `idy`, will be mandatory to correct find the record.

## Findy and Findy!

We encourage you to use this methods and avoid tweak `find` Rails method. As you expect, it will find directly via idy, so a normal integer will be not found, even if it exists on database.

### Findy

The bumpless version returns `nil` when record is not found.

```ruby
Article.findy('My').id
# 1

Article.findy 'missing'
# nil
```

### Findy!

The bump `!` version raises an error when record is not found.

```ruby
Article.findy!('My').id
# 1

Article.findy! 'missing'
# ActiveRecord::RecordNotFound: Couldn't find Article with 'idy'="missing"
```

## Functions

You can encode a number manually:

```rb
Model.idy_encode(idy)
```

You can decode an idy in case you want to use the ActiveRecord methods with the original ID:

```rb
Model.idy_decode(idy)
```

## Inspiration

It was inspired and improved from:

- [obfuscate_id](https://github.com/namick/obfuscate_id)
- [hashids_uri](https://github.com/danieldraper/hashids_uri)
