# Contributing to bloc_meta

Thank you for your interest in contributing to `bloc_meta`! We welcome contributions from the community.

## Getting Started

1.  **Fork the repository** on GitHub.
2.  **Clone your fork** locally:
    ```bash
    git clone https://github.com/maranix/bloc_meta.git
    ```
3.  **Create a new branch** for your feature or bug fix:
    ```bash
    git checkout -b feature/my-new-feature
    ```

## Development Workflow

This project is a monorepo containing two packages:
-   `packages/bloc_meta`: The annotation package.
-   `packages/bloc_meta_generator`: The code generator package.

### Running Tests

To run tests for the generator:

```bash
cd packages/bloc_meta_generator
dart test
```

### Code Style

Please ensure your code follows the standard Dart style guide. We use `dart_style` and `lints` to enforce consistency.

## Submitting a Pull Request

1.  **Push your changes** to your fork.
2.  **Open a Pull Request** against the `main` branch of the original repository.
3.  Provide a clear description of your changes and why they are necessary.

## Reporting Issues

If you find a bug or have a feature request, please open an issue on the [Issue Tracker](https://github.com/maranix/bloc_meta/issues).
