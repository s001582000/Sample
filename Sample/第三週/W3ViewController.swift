//
//  W3ViewController.swift
//  Sample
//
//  Created by 梁雅軒 on 2018/6/13.
//  Copyright © 2018年 梁雅軒. All rights reserved.
//

import UIKit
import Alamofire
class W3ViewController: UIViewController {
    var arrData = [Pokemon]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "W3Cell", bundle: nil), forCellReuseIdentifier: "W3Cell")
        let data = loadApi()
        //解法1 (舊) 將Data轉成Json物件 再一一解包
//        if let jsonArr = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String:String]] {
//
//            for dicObject in jsonArr {
//                let pokemon = Pokemon()
//                let name = dicObject["name"]!
//                let path = dicObject["path"]!
//                pokemon.name = name
//                pokemon.path = path
//                arrData.append(pokemon)
//            }
//            tableView.reloadData()
//        }
        
        //解法二 Swift4.0以上 JSONDecoder Class物件與Api結構一致 
        let decoder = JSONDecoder()
        if let arr = try? decoder.decode([Pokemon].self, from: data){
            arrData = arr
            tableView.reloadData()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadApi() -> Data {
        //用 Alamofire 實現HttpRequest
//        Alamofire.request("http://123.xx").response { (response) in
//            let data = response.data
//
//        }
        // 傳回data 為
        let str = "[{\"name\":\"傑尼龜\",\"path\":\"https://1.bp.blogspot.com/-gMELap0P9FI/WB3fomGD9iI/AAAAAAAANnI/VZxnOuYSMJYMhmivk8VQHgVIIpeK5ZKYQCK4B/s400/Squirtle.png\"},{\"name\":\"卡比獸\",\"path\":\"https://pokemon.gameinfo.io/images/pokemon-go/143-00.png\"},{\"name\":\"噴火龍\",\"path\":\"https://1.bp.blogspot.com/-tAmetmqKxuI/WBdIesL9jjI/AAAAAAAANR0/VrtxWTz3ovA7kOmYDaPUJqIttBd51DYgACK4B/s400/Charizard.png\"}]"
        return str.data(using: .utf8)!
    }
}

class Pokemon:Codable {
    var name:String!
    var path:String!
}

extension W3ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension W3ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "W3Cell", for: indexPath) as! W3Cell
        cell.setInfo(info: arrData[indexPath.row])
        return cell
    }
}
