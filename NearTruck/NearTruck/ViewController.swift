//
//  ViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBAction func test(_ sender: Any) {
        testAPICall()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func testAPICall() {
        let url = URL(string: "https://us-central1-neartruck-79b87.cloudfunctions.net/api/getTest")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: ", error)
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                print("RESULT: ", data)
            }
        }
        
        task.resume()
    }
}

