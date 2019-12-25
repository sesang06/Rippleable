//
//  RippleableLayer.swift
//  Rippleable
//
//  Created by 조세상 on 2019/12/10.
//  Copyright © 2019 조세상. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

open class RippleLayer: CAShapeLayer {



  static let kExpandRippleBeyondSurface: CGFloat = 10
  static let kRippleStartingScale: CGFloat = 0.0
  static let kRippleTouchDownDuration: CGFloat = 0.225
  static let kRippleTouchUpDuration: CGFloat = 0.15
  static let kRippleFadeInDuration: CGFloat = 0.075
  static let kRippleFadeOutDuration: CGFloat = 0.075
  static let kRippleFadeOutDelay: CGFloat = 0.15


  private let opacityValue = 1
  public var isAnimating: Bool = false

  public var fadeOutIfComplete: Bool = false


  public override init() {
    super.init()
    self.zPosition = -1
    self.setPath()
  }



  func setPath() {
    let radius: CGFloat = sqrt(
      self.bounds.width * self.bounds.width
        +
        self.bounds.height * self.bounds.height
    )
    let ovalRect = CGRect(
      x: self.bounds.midX - radius,
      y: self.bounds.midY - radius,
      width: radius * 2,
      height: radius * 2
    )
    let path = UIBezierPath.init(ovalIn: ovalRect)
    self.path = path.cgPath
    self.frame = self.bounds

    self.borderWidth = 0

  }


  @objc
  func hitEffect(point: CGPoint) {
    self.setPath()
    self.isAnimating = true

    CATransaction.begin()
    CATransaction.setCompletionBlock {
      self.isAnimating = false
      if self.fadeOutIfComplete {
        self.fadeOutEffect()
      }
    }

    let positionAnimation: CAKeyframeAnimation = {
      let animation = CAKeyframeAnimation()

      let centerPath: UIBezierPath = {
        let path = UIBezierPath()
        let startPoint = point
        let endPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        path.close()
        return path
      }()

      animation.keyPath = "position"
      animation.path = centerPath.cgPath
      animation.keyTimes = [0, 1]
      animation.values = [0, 1]
      animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
      return animation
    }()

    let scaleAnimation: CABasicAnimation = {
      let animation = CABasicAnimation(keyPath: "transform.scale")
      animation.fromValue = Self.kRippleStartingScale
      animation.toValue = 1
      animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
      return animation
    }()

    let colorAnimation: CABasicAnimation = {
      let animation = CABasicAnimation(keyPath: "opacity")
      animation.fromValue = 0
      animation.toValue = self.opacityValue
      animation.duration = CFTimeInterval(Self.kRippleFadeInDuration)
      return animation
    }()


    let group: CAAnimationGroup = {
      let group = CAAnimationGroup()
      group.duration = 0.5
      group.animations = [positionAnimation, scaleAnimation, colorAnimation]
      group.duration = CFTimeInterval(Self.kRippleTouchDownDuration)
      return group
    }()

    self.add(group, forKey: "all")
    CATransaction.commit()

  }

  @objc
  public func fadeInEffect() {
    self.setPath()
    CATransaction.begin()
    CATransaction.setCompletionBlock {
      self.fadeOutEffect()
    }

    let colorAnimation = CABasicAnimation(keyPath: "opacity")
    colorAnimation.fromValue = 0
    colorAnimation.toValue = 1
    colorAnimation.isRemovedOnCompletion = false
    self.add(colorAnimation, forKey: "fadeIn")
    CATransaction.commit()
  }

  @objc
  public func fadeOutEffect() {
    CATransaction.begin()

    CATransaction.setCompletionBlock {
      self.removeFromSuperlayer()
    }

    let colorAnimation = CABasicAnimation(keyPath: "opacity")
    colorAnimation.fromValue = self.opacityValue
    colorAnimation.toValue = 0
    colorAnimation.duration = CFTimeInterval(Self.kRippleFadeOutDuration)
    self.add(colorAnimation, forKey: "fadeIn")
    CATransaction.commit()

  }

  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
