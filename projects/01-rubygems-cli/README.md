# CLI for Searching Ruby Gems - Proposed Solution (WIP)

## Setup environment
```bash
# Download solution.
git clone https://github.com/pdany1116/ruby-training-docs.git
cd ruby-training-docs/projects/01-rubygems-cli

# Make cli.rb executable.
chmod +x cli.rb

# Add cli.rb to $PATH to run it from anywhere.
sudo ln -s $(pwd)/cli.rb /usr/local/bin
```

## Run
### Get available options

```bash
cli.rb -h
```

## Topics to discuss

1. No rubygems.org API provided to get all gems or search by name/info.
2. Changed option "show" to "details". Is it fine or should I use "show" specific?
3. Options start with "-" or "--". Is it fine or should it not be preceded this way?
