//
//  XcodeTopCommentTests.swift
//  XcodeTopCommentTests
//
//  Created by Alejandro Martinez on 23/06/2016.
//  Copyright © 2016 Alejandro Martinez. All rights reserved.
//

import XCTest

class CommandLogicTests: XCTestCase {
    
    func testRemoveTopLine() {
        
        let lines = NSMutableArray(array: [
            "//",
            "//  XcodeTopCommentTests.swift",
            "//  XcodeTopCommentTests",
            "//",
            "//  Created by Alejandro Martinez on 23/06/2016.",
            "//  Copyright © 2016 Alejandro Martinez. All rights reserved.",
            "//",
            "\n",
            "import Foundation"
            ])
        
        removeTopComment(from: lines)
        
        let expected = [
            "\n",
            "import Foundation"
        ]
        
        XCTAssertEqual(lines, expected)
    }
    
    func testNoRemoveTopLine() {
        
        let lines = NSMutableArray(array: [
            "import Foundation",
            "\n",
            "some code"
            ])
        
        removeTopComment(from: lines)
        
        let expected = [
            "import Foundation",
            "\n",
            "some code"
        ]
        
        XCTAssertEqual(lines, expected)
    }
    
    func testChangeDate() {
        let lines = NSMutableArray(array: [
            "//",
            "//  XcodeTopCommentTests.swift",
            "//  XcodeTopCommentTests",
            "//",
            "//  Created by Alejandro Martinez on 23/06/2016.",
            "//  Copyright © 2016 Alejandro Martinez. All rights reserved.",
            "//",
            "\n",
            "import Foundation"
            ])
        
        changeDate(in: lines)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let today = dateFormatter.string(from: Date())
        
        let expected = [
            "//",
            "//  XcodeTopCommentTests.swift",
            "//  XcodeTopCommentTests",
            "//",
            "//  Created by Alejandro Martinez on \(today).",
            "//  Copyright © 2016 Alejandro Martinez. All rights reserved.",
            "//",
            "\n",
            "import Foundation"
        ]
        
        XCTAssertEqual(lines, expected)
    }
    
    func testNoChangeDate() {
        let lines = NSMutableArray(array: [
            "import Foundation",
            "\n",
            "some code"
            ])
        
        changeDate(in: lines)
        
        let expected = [
            "import Foundation",
            "\n",
            "some code"
        ]
        
        XCTAssertEqual(lines, expected)
    }
    
}
