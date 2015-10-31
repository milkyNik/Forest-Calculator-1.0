//
//  ViewController.swift
//  Forest Calculator
//
//  Created by iMac on 21.04.15.
//  Copyright (c) 2015 MilNik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    // MARK: - Propertys
    
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    
    @IBOutlet weak var diameter: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    
    @IBOutlet weak var outputResponse: UITextView! // output sum
    
    @IBOutlet weak var outputTableView: UITableView! // output table
    
    
    @IBOutlet weak var buttonName: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBAction func count(sender: AnyObject) {
        

        arrAnswers.append(counting(diameterValue, length: lengthValue, quantity: quantityValue))
        
        //println(arrAnswers)
        outputTableView.reloadData()
        
        outputText()
        scrollTableViewDown()
        
        
    }
    
    @IBAction func clear(sender: AnyObject) {
        
        if !arrAnswers.isEmpty {
        
        let clearAlert = UIAlertController(title: "Внимание!", message: "Вы действительно хотите удалить все записи?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.Cancel , handler: nil)
        
        let okAction = UIAlertAction(title: "Удалить", style: UIAlertActionStyle.Default) {
            Void in
            arrAnswers.removeAll()
            self.outputTableView.reloadData()
            self.outputText()
        }
        
        clearAlert.addAction(cancelAction)
        clearAlert.addAction(okAction)
        
        self.presentViewController(clearAlert, animated: true, completion: nil)
        }
      
    }
    
    var diameterValue = 0
    var lengthValue = 0
    var quantityValue = 0
    
    
    // MARK: - Initialization
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            diameter.text = "Диаметр"
            length.text = "Длина"
            quantity.text = "Кол-во"
            buttonName.setTitle("Считать", forState: .Normal)
            clearButton.setTitle("Очистить", forState: .Normal)
            
            let tap = UITapGestureRecognizer(target: self, action: "print:")
            myPickerView.addGestureRecognizer(tap)
            tap.delegate = self
            // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // НАДО ТЕПЕРЬ ВСЕ ОФРМИТЬ НОРМАЛЬНО!!!
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    func print(sender:UITapGestureRecognizer) {
       
        let touchPoint = sender.locationInView(sender.view?.superview)
        let frame = self.myPickerView.frame
        let selectorFrame = CGRectInset(frame, 0.0, self.myPickerView.bounds.size.height * 0.85 / 2.0)
        
        if CGRectContainsPoint(selectorFrame, touchPoint) {
            if 30...90 ~= touchPoint.x {
                count(self)
            }
        }
    }
    
    
    
    
    // MARK: - UITextView
    
    func outputText() {
        outputResponse.text = "Всего \(sum()) куб.м"
    }
    
    
    // MARK: - UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAnswers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        cell.detailTextLabel?.text = "\(arrAnswers[indexPath.row] as Double)" + " куб.м"
        
        cell.textLabel?.text = String(indexPath.row + 1) + "."
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            arrAnswers.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            outputTableView.reloadData()
            //scrollTableViewDown()
            outputText()
        }
    }
    
    func scrollTableViewDown() {
        outputTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: arrAnswers.count - 1, inSection: 0), atScrollPosition: .Bottom, animated: true)
    }
    
    
    // MARK: - UIPickerView
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return arrD.count
        } else if component == 1 {
            return arrL.count
        } else {
            return arrCount.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return "\(arrD[row]) см"
        } else if component == 1 {
            return "\(arrL[row]) м"
        } else {
            return "\(arrCount[row]) шт."
        }
    }
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            diameterValue = row
        } else if component == 1 {
            lengthValue = row
            
        } else {
            quantityValue = row
        }
        
    }

    
  }

