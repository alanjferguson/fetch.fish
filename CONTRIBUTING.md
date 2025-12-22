# Contributing to fetch.fish

Thank you for your interest in contributing to fetch.fish! This document provides guidelines and information for contributors.

## Development Setup

1. Clone the repository:
```bash
git clone https://github.com/alanjferguson/fetch.fish.git
cd fetch.fish
```

2. Install fish shell (if not already installed):
```bash
# On Ubuntu/Debian
sudo apt-get install fish

# On macOS
brew install fish

# On Arch Linux
sudo pacman -S fish
```

3. Test your changes:
```bash
fish -c "source functions/fetch.fish; fetch"
```

## Code Style

- Use `fish_indent` to format your code:
```bash
fish_indent --write functions/*.fish
```

- Follow fish shell best practices:
  - Use lowercase for local variables
  - Use descriptive function names
  - Add comments for complex logic
  - Test commands for availability before using them

## Testing

Before submitting a pull request:

1. Test the fetch function:
```bash
fish -c "source functions/fetch.fish; fetch"
```

2. Test the installation script:
```bash
fish install.fish
```

3. Test the greeting:
```bash
fish -c "fish_greeting"
```

4. Verify formatting:
```bash
fish_indent --check functions/*.fish
```

## Pull Request Process

1. Fork the repository
2. Create a new branch for your feature/fix
3. Make your changes
4. Format your code with `fish_indent`
5. Test your changes thoroughly
6. Commit with clear, descriptive messages
7. Push to your fork
8. Open a pull request with a clear description

## Reporting Issues

When reporting issues, please include:

- Your operating system and version
- Fish shell version (`fish --version`)
- Steps to reproduce the issue
- Expected vs actual behavior
- Any error messages

## Feature Requests

Feature requests are welcome! Please:

- Check if the feature has already been requested
- Describe the feature clearly
- Explain the use case
- Consider providing a pull request

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
