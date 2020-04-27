//
//  CustomLabel.swift
//  SimpleURLSession
//
//  Created by Hoang Tung on 4/26/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.font = .boldSystemFont(ofSize: 14)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
