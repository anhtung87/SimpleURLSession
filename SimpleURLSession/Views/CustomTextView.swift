//
//  CustomTextView.swift
//  SimpleURLSession
//
//  Created by Hoang Tung on 4/27/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: nil)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.sizeToFit()
    self.isScrollEnabled = false
    self.backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
