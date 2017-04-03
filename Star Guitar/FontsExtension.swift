// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)

import UIKit.UIFont

typealias Font = UIFont
#elseif os(OSX)

import AppKit.NSFont

typealias Font = NSFont
#endif

// swiftlint:disable file_length
// swiftlint:disable line_length

protocol FontConvertible {
    func font(size: CGFloat) -> Font!
}

extension FontConvertible where Self: RawRepresentable, Self.RawValue == String {
    func font(size: CGFloat) -> Font! {
        return Font(font: self, size: size)
    }

    func register() {
        let extensions = ["otf", "ttf"]
        let bundle = Bundle(for: BundleToken.self)

        guard let url = extensions.flatMap({ bundle.url(forResource: rawValue, withExtension: $0) }).first else {
            return
        }

        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .none, &errorRef)
    }
}

extension Font {
    convenience init!<FontType:FontConvertible>
            (font: FontType, size: CGFloat)
            where FontType: RawRepresentable, FontType.RawValue == String {
#if os(iOS) || os(tvOS) || os(watchOS)
        if UIFont.fontNames(forFamilyName: font.rawValue).isEmpty {
            font.register()
        }
#elseif os(OSX)
        if NSFontManager.shared().availableMembers(ofFontFamily: font.rawValue) == nil {
            font.register()
        }
#endif

        self.init(name: font.rawValue, size: size)
    }
}

enum FontFamily {

    enum ErasDemiITC: String, FontConvertible {
        case regular = "ErasITC-Demi"
    }

}

private final class BundleToken {
}
