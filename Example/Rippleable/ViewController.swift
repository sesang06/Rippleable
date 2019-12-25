//
//  ViewController.swift
//  Rippleable
//
//  Created by sesang06 on 12/23/2019.
//  Copyright (c) 2019 sesang06. All rights reserved.
//

import Rippleable
import UIKit

class ViewController: UIViewController {

  /// outLined-styled button
  let outLinedButton: RippleableButton = {
    let button = RippleableButton(type: .outlined)
    button.layer.cornerRadius = 5
    button.setTitle("Hello World!", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.primaryColor = .blue
    return button
  }()

  /// cointained-styled button
  let containedButton: RippleableButton = {
    let button = RippleableButton(type: .contained)
    button.layer.cornerRadius = 5
    button.setTitle("Hello World!", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.primaryColor = .blue
    return button
  }()

  /// text-styled button
  let textButton: RippleableButton = {
    let button = RippleableButton(type: .text)
    button.layer.cornerRadius = 5
    button.setTitle("Hello World!", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.primaryColor = .blue
    return button
  }()

  let container: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 20
    stackView.axis = .vertical
    return stackView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(self.container)
    self.container.addArrangedSubview(self.outLinedButton)
    self.container.addArrangedSubview(self.containedButton)
    self.container.addArrangedSubview(self.textButton)

    self.container.translatesAutoresizingMaskIntoConstraints = false
    self.container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    self.container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

    [self.outLinedButton, self.containedButton, self.textButton].forEach { button in
      button.translatesAutoresizingMaskIntoConstraints = false
      button.heightAnchor.constraint(equalToConstant: 50).isActive = true
      button.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }

  }
}

