import UIKit
import CoreGraphics
import CoreText
import SwiftUI

public enum FontError: Swift.Error {
   case failedToRegisterFont
}

func registerFont(named name: String) throws {
   guard let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
      let provider = CGDataProvider(data: asset.data as NSData),
      let font = CGFont(provider),
      CTFontManagerRegisterGraphicsFont(font, nil) else {
    throw FontError.failedToRegisterFont
   }
}

public struct FontRegistration {
   public let name: String

   public init(named name: String) {
      self.name = name
      do {
         try registerFont(named: name)
      } catch {
         let reason = error.localizedDescription
         fatalError("Failed to register font: \(reason)")
      }
   }

   public static let regular = FontRegistration(named: "Inter-Regular")
   public static let medium = FontRegistration(named: "Inter-Medium")
   public static let semiBold = FontRegistration(named: "Inter-SemiBold")
}
