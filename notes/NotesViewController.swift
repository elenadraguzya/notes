//
//  NotesViewController.swift
//  notes
//
//  Created by Olena on 16.04.2020.
//  Copyright © 2020 Elena Draguzya. All rights reserved.
//

import UIKit

protocol NoteViewDelegate {
    func didUpdateNoteWithTitle(newTitle: String, newBody: String)
    
}

class NotesViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var text: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var textStr : String!
    var delegate : NoteViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.text.text = self.textStr
        self.text.becomeFirstResponder()
        self.text.delegate = self
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.doneButton.tintColor = UIColor(red: 0, green: 122.0/255.0, blue: 1, alpha: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.delegate != nil {
            self.delegate!.didUpdateNoteWithTitle(newTitle: self.navigationItem.title!, newBody: self.text.text)
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
    
    @IBAction func doneEdit(_ sender: Any) {
        self.text.resignFirstResponder()
        self.doneButton.tintColor = UIColor.clear
        if self.delegate != nil {
            self.delegate!.didUpdateNoteWithTitle(newTitle: self.navigationItem.title!, newBody: self.text.text)
         }
    }
}

