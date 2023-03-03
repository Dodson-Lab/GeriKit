//
//  TUGLogic.swift
//  SurveyApp
//
//  Created by Gabriela Lopez Otero 2023.
//  Copyright © 2023 Gabriela Lopez Otero. All rights reserved.
//

import SwiftUI

func TUGLogic(age: Int, stands: Int, gen: Int)-> (String) {
    //let resultBelow = "indicates a below average risk for falls."
    //let resultAbove = "indicates a normal result."
    var toRet = "This does not indicate that the patient is at risk for falls."


            if(stands > 10 && stands <= 20){
                toRet = "A time between 11-20 seconds indicates a higher risk for falls."
            }


        if(stands <= 30 && stands > 20){
            toRet = "A time between 20 and 30 seconds indicates a very high risk for falls. Patient likely requires a gait aid"
        }
        if(stands >= 30){
            toRet = "A time between above 30 seconds indicates patient is prone to frequent falls. Patient is likely dependent in ADLs (Activities of Daily Living) and requires assistance."
        }
        else if(age < 60 || age > 99){
            toRet = "This test is meant for people age 60-99."
        }
    

    return(toRet)
}
