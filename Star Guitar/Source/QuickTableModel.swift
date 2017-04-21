//
//  QuickTableModel.swift
//  QuickTableViewController
//
//  Created by Ben on 01/09/2015.
//  Copyright (c) 2015 bcylin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import UIKit

/// A struct that represents a section in a table view.

public struct Section {

    /// The text of the section title.
    public var title: String?

    /// The array of rows in the section.
    public var rows: [Row]

    /// The text of the section footer.
    public var footer: String?

    ///
    public init(title: String?, rows: [Row], footer: String? = nil) {
        self.title = title
        self.rows = rows
        self.footer = footer
    }

}


// MARK: - Row


/// Any type that conforms to this protocol is capable of representing a row in a table view.

public protocol Row {
    /// The title text of the row.
    var title: String { get }
    /// The subtitle text of the row.
    var subtitle: Subtitle? { get }
    /// The reuse identifier of the table view cell to display the row.
    var cellReuseIdentifier: String { get }
    /// A closure related to the action of the row.
    var action: ((Row) -> Void)? { get }

    func render(viewCell: UIView)

    func getRowHeight(indexPath: IndexPath) -> CGFloat

    func shouldHighlightRowAt() -> Bool
    
    func setSelectedRowAt(isSelected: Bool)
    func setHighlightRowAt(didHighlight: Bool)
}

extension Row {

    /// Returns true iff `lhs` and `rhs` have equal titles and subtitles.
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title && lhs.subtitle == rhs.subtitle
    }

}


// MARK: - Icon


/// Any type that conforms to this protocol is able to show an icon image in a table view.

public protocol IconEnabled: Row {
    /// The icon of the row.
    var icon: Icon? { get }
}

/// A struct that represents the image used in a row.

public struct Icon: Equatable {

    /// The image of the normal state.
    public var image: UIImage? {
        return _image ?? UIImage(named: imageName ?? "")
    }

    /// The image of the highlighted state.
    public var highlightedImage: UIImage? {
        return _highlightedImage ?? UIImage(named: highlightedImageName)
    }

    // swiftlint:disable variable_name
    fileprivate var _image: UIImage?
    fileprivate var _highlightedImage: UIImage?
    // swiftlint:eable variable_name

    internal private(set) var imageName: String?
    internal var highlightedImageName: String {
        if let name = imageName {
            return name + "-highlighted"
        } else {
            return ""
        }
    }

    ///
    public init(imageName: String) {
        self.imageName = imageName
    }

    ///
    public init(image: UIImage, highlightedImage: UIImage? = nil) {
        _image = image
        _highlightedImage = highlightedImage
    }

    private init() {
    }

    // MARK: Equatable

    /// Returns true iff `lhs` and `rhs` have equal images, highlighted images and image names.
    public static func ==(lhs: Icon, rhs: Icon) -> Bool {
        if let lhsName = lhs.imageName, let rhsName = rhs.imageName {
            return lhsName == rhsName
        } else {
            return lhs._image == rhs._image && lhs._highlightedImage == rhs._highlightedImage
        }
    }

}



// MARK: - Subtitle


/// An enum that represents a subtitle text with `UITableViewCellStyle`.

public enum Subtitle: Equatable {

    /// Does not show a subtitle as `UITableViewCellStyle.default`.
    case none
    /// Shows the associated text in `UITableViewCellStyle.subtitle`.
    case belowTitle(String)
    /// Shows the associated text in `UITableViewCellStyle.value1`.
    case rightAligned(String)
    /// Shows the associated text in `UITableViewCellStyle.value2`.
    case leftAligned(String)

    /// Returns the descriptive name of the style.
    public var style: String {
        get {
            switch self {
            case .none: return "Subtitle.None"
            case .belowTitle(_): return "Subtitle.BelowTitle"
            case .rightAligned(_): return "Subtitle.RightAligned"
            case .leftAligned(_): return "Subtitle.LeftAligned"
            }
        }
    }

    /// Returns the associated text of the case.
    public var text: String? {
        get {
            switch self {
            case let .belowTitle(text): return text
            case let .rightAligned(text): return text
            case let .leftAligned(text): return text
            default: return nil
            }
        }
    }

    // MARK: Equatable

    /// Returns true iff `lhs` and `rhs` have equal texts in the same `Subtitle`.
    public static func ==(lhs: Subtitle, rhs: Subtitle) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case let (.belowTitle(a), .belowTitle(b)):
            return a == b
        case let (.rightAligned(a), .rightAligned(b)):
            return a == b
        case let (.leftAligned(a), .leftAligned(b)):
            return a == b
        default:
            return false
        }
    }

}
