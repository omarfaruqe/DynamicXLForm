//
//  Protocol.swift
//  DynamicXLForm
//
//  Created by Omar Faruqe on 2015-08-31.
//  Copyright (c) 2015 Omar Faruqe. All rights reserved.
//

import Foundation

protocol writeValueBackDelegate {
    func writeValueBack(value: String)
    
}

protocol writeIdentifierBackDelegate{
    func writeIdentifierNameBack(value: String)
}