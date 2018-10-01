//
//  ViewController.swift
//  CatalogTemplate
//
//  Created by muukii on 9/28/18.
//  Copyright © 2018 muukii. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!

  private lazy var manager: SessionManager = {

    let manager = SessionManager.init(configuration: .background(withIdentifier: "me.muukii.background"))

    return manager
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func didTapButton(_ sender: Any) {

    manager.request(
      "https://httpbin.org/get",
      method: .get,
      parameters: [:],
      encoding: URLEncoding.default,
      headers: [:]
      )
      .response { (response) in
        print(response)
      }
      .resume()

    manager.request(
      "https://httpbin.org/post",
      method: .post,
      parameters: [:],
      encoding: JSONEncoding.default,
      headers: [:]
      )
      .response { (response) in
        print(response)
      }
      .resume()

  }

}

