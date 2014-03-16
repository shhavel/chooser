# Chooser

Provides short interface for choosig elements from array of structs.

## Installation

Add this line to your application's Gemfile:

    gem 'chooser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chooser

## Usage

Given array of struct kind objects.

```rb
Person = Struct.new(:name, :profession, :address, :age)

alex = Person.new("Alex", "Programmer", "123 Maple, Anytown NC", 27)
dave = Person.new("Dave", "Programmer", "236 Main", 32)
nick = Person.new("Nick", "Designer", "237 Main st.", 29)
jack = Person.new("Jack", "QA", "1010 Center st.", 29)

people = [alex, dave, nick, jack]
```

Filtering elements by attribute equality.

```rb
people.choose(:profession => "Programmer") # => [alex, dave]
```

Filtering elements by attribute equality and inclusion.

```rb
people.choose(:profession => "Designer", :age => (29..32)) # => [nick]
```

Filtering elements by matching regexp.

```rb
people.choose(:address => /Main/) # => [dave, nick]
```

Filtering elements by instance evaluating string.

```rb
people.choose("age >= 29") # => [dave, nick, jack]
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/chooser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
