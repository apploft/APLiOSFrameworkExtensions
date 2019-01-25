//
// Created by apploft on 18.12.18.
// Copyright © 2019 apploft GmbH.
// MIT License · http://choosealicense.com/licenses/mit/

import WebKit

public extension WKHTTPCookieStore {

    /// Set the given cookies or replace them in case they exist
    /// already. Note: This operation happens asynchronously.
    ///
    /// - Parameter cookies: the list of cookies to set or replace
    /// - Parameter completinHandler: a completion handler which will be called from the main thread
    ///   when the cookie replacement operation has finished
    ///
    public func setOrReplaceCookies(newCookies: [HTTPCookie]?, completionHandler: (() -> Void)? = nil) {
        let cookiesToReplace = newCookies?.map { $0.name }
        let cookieReplaceOpQueue = DispatchQueue(label: "Cookie replace queue")
        let dispatchGroup = DispatchGroup()

        // Unfortunately, the WKHTTPCookieStore is not very well-documented.
        // It is unclear how to properly override a cookie. The naïve approach
        // of just setting a new cookie with a new value worked at first glance,
        // but turned out to be unreliable in one way or another.
        // Hence we remove all cookies we want to update before setting them
        // again.
        //
        // If Apple's documentation:
        //     https://developer.apple.com/documentation/webkit/wkhttpcookiestore?language=objc
        // becomes clearer one day, feel free to refactor this piece of code
        // to reflect the correct way® of updating cookies.
        //
        getAllCookies { (allCookies) in
            allCookies.forEach { cookie in
                if cookiesToReplace?.contains(cookie.name) ?? false {
                    dispatchGroup.enter()

                    DispatchQueue.main.async { [weak self] in
                        guard let strongSelf = self else {
                            dispatchGroup.leave()
                            return
                        }

                        strongSelf.delete(cookie) { dispatchGroup.leave() }
                    }
                }
            }

            cookieReplaceOpQueue.async {
                dispatchGroup.wait()
                DispatchQueue.main.async { [weak self] in
                    newCookies?.forEach { self?.setCookie($0, completionHandler: nil) }
                    completionHandler?()
                }
            }
        }
    }
}
