//
//  SwitchCell.swift
//  Yelp
//
//  Created by Hina Sakazaki on 9/25/15.
//  Copyright © 2015 Hina Sakazaki. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell: SwitchCell, didChangeValue value:Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        filterSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        filterSwitch.onTintColor = UIColor(hue: 0.0833, saturation: 0.61, brightness: 0.95, alpha: 1.0) /* #f2a85e */

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged(){
        if (delegate != nil) {
            delegate?.switchCell?(self, didChangeValue: filterSwitch.on)
        }
    }

}
