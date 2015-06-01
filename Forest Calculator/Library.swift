//
//  Library.swift
//  Forest Calculator
//
//  Created by iMac on 21.04.15.
//  Copyright (c) 2015 MilNik. All rights reserved.
//

import Foundation

// MARK: - The volume of logs

let l1 = [0.008,0.01,0.012,0.014,0.016,0.018,0.021,0.024,0.027,0.03,0.033,0.037,0.04,0.044,0.048,0.053,0.057,0.062,0.067,0.072,0.077,0.082,0.087,0.094,0.1,0.105,0.11,0.115,0.12,0.13,0.14,0.145,0.15,0.155,0.16,0.17,0.18,0.185,0.19,0.2,0.21,0.22,0.23,0.24,0.25,0.26,0.27,0.28,0.29,0.3,0.31,0.32,0.33,0.34,0.35,0.36,0.37,0.38,0.39,0.405,0.42,0.43,0.44,0.45,0.46,0.475,0.49,0.505,0.52,0.53,0.54]

let l15 = [0.012,0.016]
let l2 = [0.017,0.022]
let l25 = [0.022,0.027]
let l3 = [0.026,0.032]
let l35 = [0.031,0.037]
let l4 = [0.037,0.045]
let l45 = [0.044,0.053]
let l5 = [0.051,0.062]
let l55 = [0.058,0.07]
let l6 = [0.065,0.08]
let l65 = [0.075,0.09]
let l7 = [0.082,0.098]
let l75 = [0.09,0.108]
let l8 = [0.1,0.12]
let l85 = [0.11,0.13]

let dictionaryArrays = [
    "1":l1,
    "1.5":l15,
    "2":l2,
    "2.5":l25,
    "3":l3,
    "3.5":l35,
    "4":l4,
    "4.5":l45,
    "5":l5,
    "5.5":l55,
    "6":l6,
    "6.5":l65,
    "7":l7,
    "7.5":l75,
    "8":l8,
    "8.5":l85]

let arrays = [l1,l15,l2,l25,l3,l35,l4,l45,l5,l55,l6,l65,l7,l75,l8,l85]

// MARK: - The size of the logs

let arrD = [10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80] // diameter logs
let arrL = [1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5] // length of the log


// MARK: - The number of logs

let arrCount = [1,2,3,4,5,6,7,8,9,10] // the number of logs

func counting(diameter: Int,length: Int, quantity: Int) -> Double {
    
    let array = arrays[length]
    let value = array[diameter]
    
    var sum = value * Double(quantity+1)
    
    return sum
}

func sum() -> Double {
    
    var sum : Double = 0.0
    
    for i in arrAnswers {
        sum += i
    }
    
    return sum
}

// MARK: - Output response

//var arrAnswer : [String] = ["123","321","432","543","567"]

var arrAnswers : [Double] = []










