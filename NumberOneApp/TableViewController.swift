//
//  TableViewController.swift
//  NumberOneApp
//
//  Created by Renan Diniz on 25/07/19.
//  Copyright © 2019 RMD Goup. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var bookInfo: BookInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = bookInfo.bookTitle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBookPage" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell),
                let dest = segue.destination as? BookPageViewController {
                

                let unit = bookInfo.units[indexPath.section]
                let part = unit.parts[indexPath.item]
                
                //let module = bookInfo.modules[indexPath.section]
                //let classe = module.classes[indexPath.item]
                
                dest.bookPageImageName = "\(bookInfo.bookTitle)\(unit.unitName)\(part)"
                dest.pageNumber = 1
            }
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return bookInfo.units.count
        //return self.bookInfo.modules.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let unit = bookInfo.units[section]
        //let module = bookInfo.modules[section]
        return unit.parts.count
        //return module.classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let unit = bookInfo.units[indexPath.section]
        //let module = bookInfo.modules[indexPath.section]
        let part = unit.parts[indexPath.item]
        //let classe = module.classes[indexPath.item]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = part
        
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
//        cell2.textLabel?.text = classe
        
        return cell
        //return cell2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let unit = bookInfo.units[section]
        //let module = bookInfo.modules[section]

        return unit.unitName
        //return module.moduleName
    }
}
