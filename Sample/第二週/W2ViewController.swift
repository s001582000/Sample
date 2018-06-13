//
//  W2ViewController.swift
//  Sample
//
//  Created by 梁雅軒 on 2018/6/13.
//  Copyright © 2018年 梁雅軒. All rights reserved.
//

import UIKit

class W2ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //註冊Cell給TableView
        tableView.register(UINib(nibName: "LeftCell", bundle: nil), forCellReuseIdentifier: "LeftCell")
        
        tableView.register(UINib(nibName: "RightCell", bundle: nil), forCellReuseIdentifier: "RightCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//擴增 W2ViewController 遵循 UITableViewDataSource協定
extension W2ViewController : UITableViewDataSource {
    //回傳要顯示幾個Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

//擴增 W2ViewController 遵循 UITableViewDelegate協定
extension W2ViewController : UITableViewDelegate {
    //回傳每個Section要顯示幾個row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //回傳每個Cell的樣式
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath) as! LeftCell
            cell.lblMessage.text = "我是第\(indexPath.row)行"
            cell.imgvPhoto.image = UIImage(named: "pikacha")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightCell
            cell.lblMessage.text = "我是第\(indexPath.row)行"
            cell.imgvPhoto.image = UIImage(named: "pikacha2")
            return cell
        }
    }
    
    //row點擊事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //結束點擊
        tableView.deselectRow(at: indexPath, animated: true)
        print("我按到了第\(indexPath.row)個")
    }
}


