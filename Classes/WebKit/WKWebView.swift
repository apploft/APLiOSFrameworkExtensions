//
//  WKWebView.swift
//

import WebKit

public extension WKWebView {
    
    typealias JavaScriptCompletionHandler = ((Any?, Error?) -> Void)
    
    /// Execute the specified java script file.
    /// - Parameter filename: the name of the file containing JavaScript code
    /// - Parameter fileExtension: optionally the file extension of JavaScript file
    /// - Parameter completionHandler: optionally a completion handler
    public func executeJavaScriptFile(_ filename: String, fileExtension: String? = "js", completionHandler: JavaScriptCompletionHandler?) {
        if let path = Bundle.main.path(forResource: filename, ofType: fileExtension),
           let source = try? NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String {
            return evaluateJavaScript(source, completionHandler: completionHandler)
        } else {
            print("User script could not be executed from file '\(filename).\(String(describing: fileExtension))'")
            completionHandler?(nil, NSError.fileNotFound2)
        }
    }
}
