//
//  CommonTests.swift
//  FontTests
//
//  Created by Vladimir Burdukov on 23/8/17.
//
//

import Foundation
import XCTest
import Nimble

class CommonTests: XCTestCase {

  func testFonts() {
    let fonts = [
      FontFamily.Lato.black,
      FontFamily.Lato.blackItalic,
      FontFamily.Lato.bold,
      FontFamily.Lato.boldItalic,
      FontFamily.Lato.hairline,
      FontFamily.Lato.hairlineItalic,
      FontFamily.Lato.heavy,
      FontFamily.Lato.heavyItalic,
      FontFamily.Lato.italic,
      FontFamily.Lato.light,
      FontFamily.Lato.lightItalic,
      FontFamily.Lato.medium,
      FontFamily.Lato.mediumItalic,
      FontFamily.Lato.regular,
      FontFamily.Lato.semibold,
      FontFamily.Lato.semiboldItalic,
      FontFamily.Lato.thin,
      FontFamily.Lato.thinItalic
    ]

    for font in fonts {
      expect(font.font(size: 12).familyName) == "Lato"
    }

    for font in fonts {
      expect(font.font(size: 13).familyName) == "Lato"
    }

    #if os(iOS) || os(tvOS) || os(watchOS)
    let names = UIFont.fontNames(forFamilyName: "Lato")
    #elseif os(OSX)
    let names = NSFontManager.shared().availableMembers(ofFontFamily: "Lato")!.flatMap { $0.first as? String }
    #endif

    for font in fonts {
      expect(names.contains(font.name)).to(beTruthy())
    }

    expect(FontConvertible.registrations.count) == fonts.count

    for value in FontConvertible.registrations.values {
      expect(value) == 1
    }
  }

}
