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
    
    @IBAction func read(_ sender: Any) {
        readMen()
    }
    
    @IBAction func write(_ sender: Any) {
        createMan(name: "yoon", age: 29)
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
                print("RESULTTEST: ", str)
            }
        }
        
        task.resume()
    }
    
    func createMan(name: String, age: Int) {
        let parameters: Parameters = ["name": name, "age": age]
        let url = "https://us-central1-neartruck-79b87.cloudfunctions.net/api/menCreate"
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if let error = response.error {
                print("ERROR: ", error)
            } else {
                print("Created Man: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "")")
            }
        }
    }
    
    func readMen() {
        let url = "https://us-central1-neartruck-79b87.cloudfunctions.net/api/menRead"
        
        AF.request(url, method: .get).response { response in
            if let error = response.error {
                print("ERROR: ", error)
            } else {
                print("Received Men: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "")")
            }
        }
    }
    
    func updateMan(name: String, age: Int) {
        let parameters: [String: Any] = ["name": name, "age": age]
        let url = "https://us-central1-neartruck-79b87.cloudfunctions.net/api/menUpdate"
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if let error = response.error {
                print("ERROR: ", error)
            } else {
                print("Updated Man: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "")")
            }
        }
    }
    
    func deleteMan(name: String) {
        let parameters: [String: Any] = ["name": name]
        let url = "https://us-central1-neartruck-79b87.cloudfunctions.net/api/men"
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if let error = response.error {
                print("ERROR: ", error)
            } else {
                print("Deleted Man: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "")")
            }
        }
    }
    
}

