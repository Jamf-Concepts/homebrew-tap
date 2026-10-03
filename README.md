# Jamf-Concepts Tap

## How do I install these formulae?

`brew install jamf-concepts/tap/<formula>`

Or `brew tap jamf-concepts/tap`, `brew trust jamf-concepts/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "jamf-concepts/tap", trusted: true
brew "<formula>"
```

Homebrew loads formulae from a non-official tap only if you trust them.
`brew install jamf-concepts/tap/<formula>` trusts that formula.
The short `<formula>` name and a `Brewfile` need the tap to be trusted.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
