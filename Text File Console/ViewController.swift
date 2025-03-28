//
//  ViewController.swift
//  Text File Console
//
//  Created by gabriela.p.nogueira on 27/03/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loadFileAndPrintButtonPressed(_ sender: UIButton) {
        
        if let file = Bundle.main.url(forResource: "example", withExtension: "txt") {
            do {
                let content = try String(contentsOf: file, encoding: .utf8)
                print("File Content:\n\(content)")
                
                self.showMessage("✅ File loaded successfully! Check the console to read the text.", color: .systemGreen)
                
            } catch {
                print("Error loading file: \(error.localizedDescription)")
                self.showMessage("❌ An error occurred while trying to load file! Check the console for more details.", color: .systemRed)
            }
        } else {
            print("File not found in bundle.")
            self.showMessage("⚠️ File not found in bundle!", color: .systemOrange)
        }
    }

    
    
    func showMessage(_ text: String, color: UIColor) {
        messageLabel.text = text
        messageLabel.textColor = color
        messageLabel.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.messageLabel.alpha = 1
        }
    }
}

