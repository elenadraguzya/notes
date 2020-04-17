//
//  NotesViewController.swift
//  notes
//
//  Created by Olena on 16.04.2020.
//  Copyright © 2020 Elena Draguzya. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet var text: UITextView!
    
    var textStr : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.text.text = self.textStr
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
