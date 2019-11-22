//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ColorTableController: UIViewController {
    
    // possible property observer, reload data
    var crayons = [Crayon]()
    
    // possible instance optional
    
    @IBOutlet weak var colorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.dataSource = self
        crayons = Crayon.allTheCrayons
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedColorController = segue.destination as? DetailedColorController, let indexPath = colorTableView.indexPathForSelectedRow else {
                fatalError("Segue Issue")
        }
        
        let color = crayons[indexPath.row]
        detailedColorController.crayon = color
    }
    
}

extension ColorTableController: UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let doubleToCGFloatDenominator: Double = 255
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellColor", for: indexPath)
        let crayonColor = crayons[indexPath.row]
        
        let redValue = CGFloat((crayonColor.red) / doubleToCGFloatDenominator)
        let greenValue = CGFloat((crayonColor.green) / doubleToCGFloatDenominator)
        let blueValue = CGFloat((crayonColor.blue) / doubleToCGFloatDenominator)
        let defaultAlphaValue = CGFloat(1)
        
        let cellColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: defaultAlphaValue)

        
        cell.textLabel?.text = crayonColor.name
        cell.detailTextLabel?.text = crayonColor.hex
        cell.backgroundColor = cellColor
        
        return cell
    }
}
