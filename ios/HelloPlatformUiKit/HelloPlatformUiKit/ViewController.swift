//
//  ViewController.swift
//  HelloPlatformUiKit
//
//  Created by James Shvarts on 5/3/20.
//  Copyright © 2020 James Shvarts. All rights reserved.
//

import UIKit
import common

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
    label.center = CGPoint(x: 160, y: 285)
    label.textAlignment = .center
    label.font = label.font.withSize(25)
    label.text = CommonKt.createApplicationScreenMessage()
    view.addSubview(label)
  }
}

