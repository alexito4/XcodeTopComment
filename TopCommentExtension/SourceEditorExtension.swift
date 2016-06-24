//
//  SourceEditorExtension.swift
//  TopCommentExtension
//
//  Created by Alejandro Martinez on 23/06/2016.
//  Copyright © 2016 Alejandro Martinez. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    
    func extensionDidFinishLaunching() {
        // If your extension needs to do any work at launch, implement this optional method.
        print("============================================")
        print("      SourceEditorExtension launched")
        print("============================================")

    }
 
    
    /*
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: AnyObject]] {
        // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
        return []
    }
    */
    
}
