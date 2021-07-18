//
//  ViewController.swift
//  NHL Teams
//
//  Created by Alexey Mefodyev on 11.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var toTheRosterButton: UIButton!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCopyright()
    }
    
    @IBAction func toTheRosterButtonIsTapped(_ sender: Any) {
        performSegue(withIdentifier: "toTheRoster", sender: nil)
    }
    private func fetchCopyright() {
        guard let url = URL(string: urlOfRoster) else {
            print("Unavailable link")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            
            guard let data = data else {
                return
            }
            
            do {
                let JSONDescription = try JSONDecoder().decode(FullRoster.self, from: data)
                
                DispatchQueue.main.async {
                    self.copyrightLabel.text = JSONDescription.copyright
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

