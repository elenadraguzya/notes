//
//  ViewController.swift
//  notes
//
//  Created by Olena on 15.04.2020.
//  Copyright © 2020 Elena Draguzya. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
        
    var arrNotes = [[String:String]]()
    
    var selectedIndex = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNote(_ sender: Any) {
        let newDict = ["title" : "TestTitle",
         "body" : "TestBody"]
        arrNotes.insert(newDict, at: 0)
        
        self.selectedIndex = 0
        self.tableView.reloadData()
        performSegue(withIdentifier: "showEditorSegue", sender: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")!
        cell.textLabel!.text = arrNotes[indexPath.row] ["title"]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEditorSegue", sender: nil)
        self.selectedIndex = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let notesEditor = segue.destination as! NotesViewController
        notesEditor.navigationItem.title = arrNotes[self.selectedIndex]["title"]
        notesEditor.textStr = arrNotes[self.selectedIndex]["body"]
    }

}

