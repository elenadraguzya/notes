//
//  NotesViewController.swift
//  notes
//
//  Created by Olena on 16.04.2020.
//  Copyright © 2020 Elena Draguzya. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var text: UITextView!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.text.becomeFirstResponder()
        self.text.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            text.text = note.content
        } else {
            text.text = ""
        }
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        let components = self.text.text.components(separatedBy: ".")
        self.navigationItem.title = ""
        for item in components {
            if (item.trimmingCharacters(in: .whitespacesAndNewlines)).count > 0 {
                self.navigationItem.title = item
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? ViewController
        else { return }
        
        switch identifier {
        case "save" where note != nil:
            note?.content = text.text ?? ""
            destination.tableView.reloadData()
            
        case "save" where note == nil:
            let note = Note()
            note.content = text.text
            if note.content != "" {
                destination.notes.append(note)
            }
            
        case "cancel":
            print("cancel bar button item tapped")

        default:
            print("unexpected segue identifier")
        }
    }
}
