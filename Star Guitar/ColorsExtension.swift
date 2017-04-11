// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#elseif os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#endif

extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
enum ColorName {
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5d5a5a"></span>
  /// Alpha: 100% <br/> (0x5d5a5aff)
  case headerSectionDivide
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#29abe2"></span>
  /// Alpha: 100% <br/> (0x29abe2ff)
  case mutes
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#00ff00"></span>
  /// Alpha: 100% <br/> (0x00ff00ff)
  case resultsBoarder
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#999999"></span>
  /// Alpha: 100% <br/> (0x999999ff)
  case selectedHighLine
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#626364"></span>
  /// Alpha: 100% <br/> (0x626364ff)
  case tableRowBG
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3f3b3a"></span>
  /// Alpha: 100% <br/> (0x3f3b3aff)
  case vcbg
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33ace0"></span>
  /// Alpha: 100% <br/> (0x33ace0ff)
  case vcHeaderDivide

  var rgbaValue: UInt32 {
    switch self {
    case .headerSectionDivide:
      return 0x5d5a5aff
    case .mutes:
      return 0x29abe2ff
    case .resultsBoarder:
      return 0x00ff00ff
    case .selectedHighLine:
      return 0x999999ff
    case .tableRowBG:
      return 0x626364ff
    case .vcbg:
      return 0x3f3b3aff
    case .vcHeaderDivide:
      return 0x33ace0ff
    }
  }

  var color: Color {
    return Color(named: self)
  }
}
// swiftlint:enable type_body_length

extension Color {
  convenience init(named name: ColorName) {
    self.init(rgbaValue: name.rgbaValue)
  }
}
