//
//  SwiftDebugLog.swift
//  SQRA
//
//  Created by Peter Gits on 9/11/2019.
//  Copyright © 2016 Mobility. All rights reserved.
//

import Foundation

func releasePrint(object: Any) {
    Swift.print(object)
}

func print(object: Any) {
#if DEBUG
        Swift.print(object)
#endif
}
