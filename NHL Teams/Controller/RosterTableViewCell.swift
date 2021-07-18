//
//  RosterTableViewCell.swift
//  NHL Teams
//
//  Created by Alexey Mefodyev on 18.07.2021.
//

import UIKit

class RosterTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionNameLabel: UILabel!
    @IBOutlet weak var positionTypeLabel: UILabel!
    @IBOutlet weak var positionAbbreviationLabel: UILabel!
    
    
    func configureRoster(_ roster: Roster) {

        numberLabel.text = roster.jerseyNumber
        nameLabel.text = roster.person.fullName
        positionNameLabel.text = roster.position.name
        positionTypeLabel.text = roster.position.type
        positionAbbreviationLabel.text = roster.position.abbreviation
        
    }

}
