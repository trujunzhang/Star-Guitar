// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit
import Star_Guitar

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> Star_Guitar.SGTuningsStandardViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? Star_Guitar.SGTuningsStandardViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case sgSettingsViewControllerScene = "sgSettingsViewController"
    static func instantiateSgSettingsViewController() -> Star_Guitar.SGSettingsViewController {
      guard let vc = StoryboardScene.Main.sgSettingsViewControllerScene.viewController() as? Star_Guitar.SGSettingsViewController
      else {
        fatalError("ViewController 'sgSettingsViewController' is not of the expected class Star_Guitar.SGSettingsViewController.")
      }
      return vc
    }

    case tableHeaderViewControllerScene = "tableHeaderViewController"
    static func instantiateTableHeaderViewController() -> Star_Guitar.TableHeaderViewController {
      guard let vc = StoryboardScene.Main.tableHeaderViewControllerScene.viewController() as? Star_Guitar.TableHeaderViewController
      else {
        fatalError("ViewController 'tableHeaderViewController' is not of the expected class Star_Guitar.TableHeaderViewController.")
      }
      return vc
    }

    case touchChordViewControllerScene = "touchChordViewController"
    static func instantiateTouchChordViewController() -> Star_Guitar.SGTouchChordViewController {
      guard let vc = StoryboardScene.Main.touchChordViewControllerScene.viewController() as? Star_Guitar.SGTouchChordViewController
      else {
        fatalError("ViewController 'touchChordViewController' is not of the expected class Star_Guitar.SGTouchChordViewController.")
      }
      return vc
    }

    case tuningsCustomViewControllerScene = "tuningsCustomViewController"
    static func instantiateTuningsCustomViewController() -> Star_Guitar.SGTuningsCustomViewController {
      guard let vc = StoryboardScene.Main.tuningsCustomViewControllerScene.viewController() as? Star_Guitar.SGTuningsCustomViewController
      else {
        fatalError("ViewController 'tuningsCustomViewController' is not of the expected class Star_Guitar.SGTuningsCustomViewController.")
      }
      return vc
    }

    case tuningsStandardViewControllerScene = "tuningsStandardViewController"
    static func instantiateTuningsStandardViewController() -> Star_Guitar.SGTuningsStandardViewController {
      guard let vc = StoryboardScene.Main.tuningsStandardViewControllerScene.viewController() as? Star_Guitar.SGTuningsStandardViewController
      else {
        fatalError("ViewController 'tuningsStandardViewController' is not of the expected class Star_Guitar.SGTuningsStandardViewController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
  enum Main: String, StoryboardSegueType {
    case customResultContainer
    case eventsContainer
    case guitarTypesContainer
    case oneColumnContainer
    case standardResultContainer
    case threeColumnContainer
    case titleContainer
    case twoChordColumnContainer
    case twoColumnContainer
    case typesContainer
  }
}

private final class BundleToken {}
