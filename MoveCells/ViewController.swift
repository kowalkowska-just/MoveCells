//
//  ViewController.swift
//  MoveCells
//
//  Created by Justyna Kowalkowska on 02/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    @IBOutlet var sortButton: UINavigationItem!
    
    var models = [
        "first",
        "second",
        "third",
        "fourth"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func didTapSort() {
        if table.isEditing {
            sortButton.title = "Sort"
            table.isEditing = false
        } else {
            sortButton.title = "Done!"
            table.isEditing = true
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 22)
        return cell
    }
    
    //move cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        models.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    //delete cells
    //Delate cells
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        table.beginUpdates()
        models.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        table.endUpdates()
    }
}
