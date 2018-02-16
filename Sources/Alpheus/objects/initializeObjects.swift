//
//  initializeObjects.swift
//  staffDirectory
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectLib
import PerfectCURL

extension Utility {
    static func initializeObjects() {

        let a0 = File()
        try? a0.setup()

        let url = "http://data.gdeltproject.org/gdeltv2/masterfilelist-translation.txt"

        print("Downloading \(url)")

        CURLRequest(url).perform {
        	confirmation in
        	do {
        		let response = try confirmation()
        		let filesContent: [String] = response.bodyString.components(separatedBy:"\n")
            for line in filesContent {
              let data: [String] = line.components(separatedBy:" ")
              try a0.insert(
                cols: ["size", "id", "url" ],
                params: data
              )
            }


        	} catch let error as CURLResponse.Error {
        		print("Failed: response code \(error.response.responseCode)")
        	} catch {
        		print("Fatal error \(error)")
        	}
        }

    }
}
