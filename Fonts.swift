// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  typealias Font = UIFont
#endif

// swiftlint:disable file_length

extension Dictionary {

  subscript(_ key: Key, or `default`: Value) -> Value {
    get { return self[key] ?? `default` }
    set { self[key] = newValue }
  }

}

struct FontConvertible {
  let name: String
  let family: String
  let path: String

  func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  static var registrations: [String: Int] = [:]

  func register() {
    FontConvertible.registrations[name, or: 0] += 1

    guard let url = url else { return }
    var errorRef: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    guard let url = bundle.url(forResource: path, withExtension: nil) else { return nil }
    return url
  }
}

extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable identifier_name line_length type_body_length
enum FontFamily {
  enum Lato {
    static let black = FontConvertible(name: "Lato-Black", family: "Lato", path: "Lato-Black.ttf")
    static let blackItalic = FontConvertible(name: "Lato-BlackItalic", family: "Lato", path: "Lato-BlackItalic.ttf")
    static let bold = FontConvertible(name: "Lato-Bold", family: "Lato", path: "Lato-Bold.ttf")
    static let boldItalic = FontConvertible(name: "Lato-BoldItalic", family: "Lato", path: "Lato-BoldItalic.ttf")
    static let hairline = FontConvertible(name: "Lato-Hairline", family: "Lato", path: "Lato-Hairline.ttf")
    static let hairlineItalic = FontConvertible(name: "Lato-HairlineItalic", family: "Lato", path: "Lato-HairlineItalic.ttf")
    static let heavy = FontConvertible(name: "Lato-Heavy", family: "Lato", path: "Lato-Heavy.ttf")
    static let heavyItalic = FontConvertible(name: "Lato-HeavyItalic", family: "Lato", path: "Lato-HeavyItalic.ttf")
    static let italic = FontConvertible(name: "Lato-Italic", family: "Lato", path: "Lato-Italic.ttf")
    static let light = FontConvertible(name: "Lato-Light", family: "Lato", path: "Lato-Light.ttf")
    static let lightItalic = FontConvertible(name: "Lato-LightItalic", family: "Lato", path: "Lato-LightItalic.ttf")
    static let medium = FontConvertible(name: "Lato-Medium", family: "Lato", path: "Lato-Medium.ttf")
    static let mediumItalic = FontConvertible(name: "Lato-MediumItalic", family: "Lato", path: "Lato-MediumItalic.ttf")
    static let regular = FontConvertible(name: "Lato-Regular", family: "Lato", path: "Lato-Regular.ttf")
    static let semibold = FontConvertible(name: "Lato-Semibold", family: "Lato", path: "Lato-Semibold.ttf")
    static let semiboldItalic = FontConvertible(name: "Lato-SemiboldItalic", family: "Lato", path: "Lato-SemiboldItalic.ttf")
    static let thin = FontConvertible(name: "Lato-Thin", family: "Lato", path: "Lato-Thin.ttf")
    static let thinItalic = FontConvertible(name: "Lato-ThinItalic", family: "Lato", path: "Lato-ThinItalic.ttf")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

private final class BundleToken {}
