//
//  ApiTableViewCell.swift
//  SimpleURLSession
//
//  Created by Hoang Tung on 4/26/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit


class ApiTableViewCell: UITableViewCell {
  
  let titleLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "Title:"
    return label
  }()
  
  let titleContentLabel = CustomContentLabel()
  
  let tagsLabel: UILabel = {
    let label = CustomLabel()
    label.text = "Tags:"
    return label
  }()
  
  let tagsContentLabel = CustomContentLabel()
  
  let answerCountLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "Answer Count:"
    return label
  }()
  
  let answerCountContentLabel = CustomContentLabel()
  
  let scoreLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "Score:"
    return label
  }()
  
  let scoreContentLabel = CustomContentLabel()
  
  let linkLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "Link:"
    return label
  }()
  
  let linkContentTextView = CustomTextView()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
    addComponent()
    setupLayout()
    setupLink()
  }
  
  func addComponent() {
    self.addSubview(titleLabel)
    self.addSubview(titleContentLabel)
    self.addSubview(tagsLabel)
    self.addSubview(tagsContentLabel)
    self.addSubview(answerCountLabel)
    self.addSubview(answerCountContentLabel)
    self.addSubview(scoreLabel)
    self.addSubview(scoreContentLabel)
    self.addSubview(linkLabel)
    self.addSubview(linkContentTextView)
  }
  
  func setupLayout() {
    titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    titleLabel.sizeToFit()
    
    titleContentLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
    titleContentLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16).isActive = true
    titleContentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    titleContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    tagsLabel.topAnchor.constraint(equalTo: titleContentLabel.bottomAnchor, constant: 8).isActive = true
    tagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    tagsLabel.sizeToFit()
    
    tagsContentLabel.topAnchor.constraint(equalTo: tagsLabel.topAnchor).isActive = true
    tagsContentLabel.leadingAnchor.constraint(equalTo: tagsLabel.trailingAnchor, constant: 16).isActive = true
    tagsContentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    tagsContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    answerCountLabel.topAnchor.constraint(equalTo: tagsContentLabel.bottomAnchor, constant: 8).isActive = true
    answerCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    answerCountLabel.sizeToFit()
    
    answerCountContentLabel.topAnchor.constraint(equalTo: answerCountLabel.topAnchor).isActive = true
    answerCountContentLabel.leadingAnchor.constraint(equalTo: answerCountLabel.trailingAnchor, constant: 8).isActive = true
    answerCountContentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    answerCountContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    scoreLabel.topAnchor.constraint(equalTo: answerCountContentLabel.bottomAnchor, constant: 8).isActive = true
    scoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    scoreLabel.sizeToFit()
    
    scoreContentLabel.topAnchor.constraint(equalTo: scoreLabel.topAnchor).isActive = true
    scoreContentLabel.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 8).isActive = true
    scoreContentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    scoreContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    linkLabel.topAnchor.constraint(equalTo: scoreContentLabel.bottomAnchor, constant: 8).isActive = true
    linkLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    linkLabel.sizeToFit()
    
    linkContentTextView.topAnchor.constraint(equalTo: scoreContentLabel.bottomAnchor).isActive = true
    linkContentTextView.leadingAnchor.constraint(equalTo: linkLabel.trailingAnchor, constant: 16).isActive = true
    linkContentTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    linkContentTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    linkContentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
  }
  
  func setupLink() {
    let attributedString = NSMutableAttributedString.init(string: linkContentTextView.text ?? "")
    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue,
                                  range: NSRange.init(location: 0, length: attributedString.length))
    attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1,
                                  range: NSRange.init(location: 0, length: attributedString.length))
    attributedString.addAttribute(NSAttributedString.Key.link, value: self.linkContentTextView.text ?? "",
                                  range: NSRange.init(location: 0, length: attributedString.length))
    linkContentTextView.attributedText = attributedString
    linkContentTextView.font = .systemFont(ofSize: 14)
  }
}
