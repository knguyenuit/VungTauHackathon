//
//  PCacheProvider.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//


protocol PCacheProvider {
    
    //Save current user
    func saveCurrentUser(user: User)
    
    //Get user
    func getCurrentUser() -> User?
    
    //save list question kid answer
    func saveListTrueQuizQuestion(listTrueQuestion: [Bool])
    
    func getListTrueQuizQuestion() -> [Bool]
}
