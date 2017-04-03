// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)

import UIKit.UIImage

typealias Image = UIImage
#elseif os(OSX)

import AppKit.NSImage

typealias Image = NSImage
#endif

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length

enum Asset: String {
    case backArrow = "BackArrow"
    case bg1 = "Bg1"
    case rightArrow = "RightArrow"
    case selected = "Selected"
    case settings = "Settings"
    case splash = "splash"
    case string14 = "string14"
    case string14Blur5 = "string14Blur5"
    case string14Blur10 = "string14Blur10"
    case string14Blur15 = "string14Blur15"
    case string14Blur20 = "string14Blur20"
    case string14Blur25 = "string14Blur25"
    case string17 = "string17"
    case string17Blur5 = "string17Blur5"
    case string17Blur10 = "string17Blur10"
    case string17Blur15 = "string17Blur15"
    case string17Blur20 = "string17Blur20"
    case string17Blur25 = "string17Blur25"
    case string20 = "string20"
    case string20Blur5 = "string20Blur5"
    case string20Blur10 = "string20Blur10"
    case string20Blur15 = "string20Blur15"
    case string20Blur20 = "string20Blur20"
    case string20Blur25 = "string20Blur25"

    var image: Image {
        let bundle = Bundle(for: BundleToken.self)
#if os(iOS) || os(tvOS) || os(watchOS)
        let image = Image(named: rawValue, in: bundle, compatibleWith: nil)
#elseif os(OSX)
        let image = bundle.image(forResource: rawValue)
#endif
        guard let result = image else {
            fatalError("Unable to load image \(rawValue).")
        }
        return result
    }
}

// swiftlint:enable type_body_length

extension Image {
    convenience init!(asset: Asset) {
#if os(iOS) || os(tvOS) || os(watchOS)
        let bundle = Bundle(for: BundleToken.self)
        self.init(named: asset.rawValue, in: bundle, compatibleWith: nil)
#elseif os(OSX)
        self.init(named: asset.rawValue)
#endif
    }
}

private final class BundleToken {
}
