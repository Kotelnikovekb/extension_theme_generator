# 1.3.2
### Changed
- Added support for analyzer 10–14.
- Updated source_gen compatibility.
- Moved build_runner to dev_dependencies.

## 1.3.1
### Fixed
- Fixed theme generation for palette-based colors (`MaterialColor`, `MaterialAccentColor`, `ColorSwatch<...>`): generator now uses the base tone (`[500]!`) instead of emitting palette objects into `ThemeExtension`, which previously broke interpolation.

### Changed
- `ThemeExtension` generated color fields now use `Color` instead of `MaterialColor` to ensure `lerp` works correctly during theme transitions (e.g., light ↔ dark).
- Generated theme instances were changed from `static const` to `static final` because palette access like `mySwatch[500]!` is not a const expression.

### Added
- Palette type detection in generator: `MaterialColor`, `MaterialAccentColor`, and `ColorSwatch<...>` are handled automatically.

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
