//
//  ViewController.swift
//  Sample
//
//  Created by 梁雅軒 on 2018/6/13.
//  Copyright © 2018年 梁雅軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrData = [Class]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...3 {
            let myClass = Class()
            switch i {
            case 1:
                myClass.title = "第一週 基礎元件教學 Autolayout"
                break
            case 2:
                myClass.title = "第二週 TableView教學"
                break
            case 3:
                myClass.title = "第一週 第三方套件 HttpRequest TableView應用"
                break
            default:
                break
            }
            myClass.week = i
            arrData.append(myClass)
        }
        self.title = "首頁"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        let info = arrData[indexPath.row]
        cell.textLabel?.text = info.title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let info = arrData[indexPath.row]
        if info.week == 1 {
            let vc = W1ViewController()
            vc.title = "第一週"
            self.navigationController?.pushViewController(vc, animated: true)
        } else if info.week == 2 {
            let vc = W2ViewController()
            vc.title = "第二週"
            self.navigationController?.pushViewController(vc, animated: true)
        } else if info.week == 3 {
            let vc = W3ViewController()
            vc.title = "第三週"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

class Class {
    var week:Int!
    var title:String!
}
