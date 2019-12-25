//
//  RippleView.swift
//  Rippleable
//
//  Created by 조세상 on 2019/12/24.
//  Copyright © 2019 조세상. All rights reserved.
//

import UIKit

open class RippleView: UIView {



  public var rippleLayer: RippleLayer?

  public var rippleFillColor: UIColor?

  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.clipsToBounds = true
    
  }

  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    let rippleLayer = RippleLayer()
    rippleLayer.frame = self.frame
    rippleLayer.fillColor = self.rippleFillColor?.cgColor
    self.layer.addSublayer(rippleLayer)

    let point = touches.first?.location(in: self) ?? .zero

    rippleLayer.hitEffect(point: point)
    self.rippleLayer?.fadeOutIfComplete = true
    self.rippleLayer = rippleLayer
  }

  open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    self.fadeOutRipple()
  }


  open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    if let point = touches.first?.location(in: self) {

      if self.point(inside: point, with: event) {

      } else {
        self.fadeOutRipple()
      }
    }
  }

  private func fadeOutRipple() {
    guard let rippleLayer = self.rippleLayer else { return }
    if rippleLayer.isAnimating {
      rippleLayer.fadeOutIfComplete = true
    } else {
      rippleLayer.fadeOutEffect()
    }

  }

  open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
  }
}
