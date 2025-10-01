## 1.3.0
### Changed
- Migrated package to support:
    - **build >=3.0.0 <5.0.0**
    - **source_gen >=3.0.0 <5.0.0**
    - **analyzer >=7.5.9 <9.0.0**
- Refactored generators (`ColorsGenerator`, `TextStyleGenerator`) to be compatible with the new analyzer API.

## 1.2.3
### Fixed
- Fixed issue with adding colors in code generation that was not related to the package. [#1](https://github.com/Kotelnikovekb/extension_theme_generator/issues/1)

## 1.1.2

### Added
- **Support for `useFinal` parameter in `TextStyleAnnotation`**  
  Introduced the `useFinal` optional parameter to the `TextStyleAnnotation` annotation. This parameter allows you to control whether the generated fields should be marked as `final`.

    - **`useFinal` Parameter**:
        - If set to `true`, the generated fields will use the `final` keyword, making them immutable after initialization.
        - If set to `false`, the `final` keyword will be omitted, allowing fields to be reassigned.

  **Example Usage**:
  ```dart
  @TextStyleAnnotation(useFinal: true)
  class MyTextStyles {
    static TextStyle header = TextStyle();
    static TextStyle body = TextStyle();
  }
  
## 1.0.1

* Metadata update

## 1.0.0

* First release
