//
//  ChairLogic.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/12/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

func chairLogic(age: Int, stands: Int, gen: Int)-> (String) {
    //let resultBelow = "indicates a below average risk for falls."
    //let resultAbove = "indicates a normal result."
    var toRet = "This does not indicate that the patient is at risk for falls."
    if (gen == 0){
        if(age >= 60 && age <= 64){
            if(stands < 14){
                toRet = "For males between 60-64 years old, less than 14 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 65 && age <= 69){
            if(stands < 12){
                toRet = "For males between 65-69 years old, less than 12 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 70 && age <= 74){
            if(stands < 12){
                toRet = "For males between 70-74 years old, less than 12 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 75 && age <= 79){
            if(stands < 11){
                toRet = "For males between 75-79 years old, less than 11 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 80 && age <= 84){
            if(stands < 10){
                toRet = "For males between 80-84 years old, less than 10 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 85 && age <= 89){
            if(stands < 8){
                toRet = "For males between 85-89 years old, less than 8 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 90 && age <= 94){
            if(stands < 7){
                toRet = "For males between 90-94 years old, less than 7 chair stands indicates a risk for falls."
            }
        }
        else if(age < 60 || age > 94){
            toRet = "This test is meant for people age 60-94."
        }
    }
    else{
        if(age >= 60 && age <= 64){
            if(stands < 12){
                toRet = "For females between 60-64 years old, less than 12 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 65 && age <= 69){
            if(stands < 11){
                toRet = "For females between 65-69 years old, less than 11 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 70 && age <= 74){
            if(stands < 10){
                toRet = "For females between 70-74 years old, less than 10 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 75 && age <= 79){
            if(stands < 10){
                toRet = "For females between 75-79 years old, less than 10 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 80 && age <= 84){
            if(stands < 9){
                toRet = "For females between 80-84 years old, less than 9 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 85 && age <= 89){
            if(stands < 8){
                toRet = "For females between 85-89 years old, less than 8 chair stands indicates a risk for falls."
            }
        }
        else if(age >= 90 && age <= 94){
            if(stands < 4){
                toRet = "For females between 90-94 years old, less than 4 chair stands indicates a risk for falls."
            }
        }
        else if(age < 60 || age > 94){
            toRet = "This test is intended for people age 60-94."
        }
    }
    return(toRet)
}
