//
//  ViewController.swift
//  notes
//
//  Created by Olena on 15.04.2020.
//  Copyright © 2020 Elena Draguzya. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, NoteViewDelegate {
            
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEditorSegue", sender: nil)
        self.selectedIndex = indexPath.row
    }
    
    func didUpdateNoteWithTitle(newTitle: String, newBody: String) {
        self.tableView.reloadData()
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {

    }
}
