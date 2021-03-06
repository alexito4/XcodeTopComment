
import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {

    public func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        
        switch invocation.commandIdentifier {
        case "com.alejandromp.XcodeTopComment.TopCommentExtension.RemoveTopComment":
            removeTopComment(from: invocation.buffer.lines)
        case "com.alejandromp.XcodeTopComment.TopCommentExtension.ChangeDate":
            changeDate(in: invocation.buffer.lines)
        default:
            fatalError("\(invocation.commandIdentifier) not supported.")
        }
        
        completionHandler(nil)
    }
}

