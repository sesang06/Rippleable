//
//  RippleableButton.swift
//  Rippleable
//
//  Created by 조세상 on 2019/12/02.
//  Copyright © 2019 조세상. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics


public enum RippleableType {
  case contained
  case outlined
  case text
}


open class RippleableButton: UIButton {

  public let rippleableView = RippleView()

  public var type: RippleableType? {
    didSet {
      self.setupType()
    }
  }

  public var primaryColor: UIColor? {
    didSet {
      self.setupType()
    }
  }

  private var observation: NSKeyValueObservation?


  public convenience init(type: RippleableType, frame: CGRect) {
    self.init(frame: frame)
    self.type = type
  }

  public convenience init(type: RippleableType) {
    self.init(frame: .zero)
    self.type = type
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupRipple()
  }


  private func setupRipple() {
    self.addSubview(self.rippleableView)

    if #available(iOS 9.0, *) {
      self.rippleableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      self.rippleableView.translatesAutoresizingMaskIntoConstraints = false
         self.rippleableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
         self.rippleableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
         self.rippleableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    } else {
      // Fallback on earlier versions
    }

    self.rippleableView.clipsToBounds = true

    self.observation = self.observe(
      \.layer.cornerRadius,
      options: [.initial, .old, .new]
    ) { (button, change) in
      guard let newCornerRadius = change.newValue else  {
        return
      }
      button.rippleableView.layer.cornerRadius = newCornerRadius
    }
  }


  private func setupType() {
    guard let type = self.type else { return }

    switch type {
    case .outlined:
      self.rippleableView.rippleFillColor = self.primaryColor?.withAlphaComponent(0.1)
      self.layer.borderColor = self.primaryColor?.cgColor
      self.layer.borderWidth = 1
      self.setTitleColor(self.primaryColor, for: .normal)
    case .contained:
      self.rippleableView.rippleFillColor = UIColor.white.withAlphaComponent(0.3)
      self.setTitleColor(.white, for: .normal)
      self.backgroundColor = self.primaryColor
      self.layer.shadowColor = UIColor.black.cgColor
      self.layer.shadowOffset = CGSize(width: 0, height: -2)
      self.layer.shadowOpacity = 0.2
      self.layer.shadowRadius = 6

    case .text:
      self.rippleableView.rippleFillColor = self.primaryColor?.withAlphaComponent(0.1)
      self.setTitleColor(self.primaryColor, for: .normal)
    }
  }

  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
