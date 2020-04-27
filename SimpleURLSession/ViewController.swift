//
//  ViewController.swift
//  SimpleURLSession
//
//  Created by Hoang Tung on 4/26/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
  
  var apiData: [Item]?
  
  let apiTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(ApiTableViewCell.self, forCellReuseIdentifier: "ApiCell")
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    addComponent()
    setupLayout()
    setupTableView()
    
    let queue = DispatchQueue(label: "APIQueue")
    queue.async {
      self.reciveData()
    }
  }

  func reciveData() {
    let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")!
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard let data = data, let response = response as? HTTPURLResponse else {
        return
      }
      print(response.statusCode)
      if response.statusCode == 200 {
        do {
          let reciveData = try JSONDecoder().decode(Items.self, from: data)
          DispatchQueue.main.async {
            self.apiData = reciveData.items
            self.apiTableView.reloadData()
          }
          
        } catch {
          print("error: \(error)")
        }
      }
    }
    
    dataTask.resume()
  }
  
  func addComponent() {
    view.addSubview(apiTableView)
  }
  
  func setupLayout() {
    apiTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    apiTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    apiTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    apiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  
  func setupTableView() {
    apiTableView.delegate = self
    apiTableView.dataSource = self
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return apiData?.count ?? 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ApiCell", for: indexPath) as! ApiTableViewCell
    cell.titleContentLabel.text = apiData?[indexPath.row].title
    cell.tagsContentLabel.text = apiData?[indexPath.row].tags.joined(separator: ", ")
    cell.answerCountContentLabel.text = "\(apiData?[indexPath.row].answer_count ?? 0)"
    cell.scoreContentLabel.text = "\(apiData?[indexPath.row].score ?? 0)"
    cell.linkContentTextView.text = apiData?[indexPath.row].link
    return cell
  }

}
