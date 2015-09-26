//
//  PickerViewCell.swift
//  Yelp
//
//  Created by Hina Sakazaki on 9/26/15.
//  Copyright © 2015 Hina Sakazaki. All rights reserved.
//

import UIKit

@objc protocol PickerViewCellDelegate {
    optional func pickerViewCell(pickerViewCell: PickerViewCell, didChangeValue value:Bool)
}
class PickerViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerLabel: UILabel!
    
    var choices: [String]! {
        didSet{
            print("hello \(choices)")
            pickerView.reloadAllComponents()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        // Initialization code
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (choices != nil) {
            return choices.count
        } else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
