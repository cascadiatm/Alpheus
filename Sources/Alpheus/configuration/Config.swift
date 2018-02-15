//
//  Config.swift
//  Perfect-App-Template
//
//  Created by Jonathan Guthrie on 2017-02-20.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import JSONConfig

struct AppCredentials {
	var clientid = ""
	var clientsecret = ""
}

func config() {
	#if os(Linux)
		let fname = "./config/ApplicationConfigurationLinux.json"
	#else
		let fname = "./config/ApplicationConfiguration.json"
	#endif

	if let configData = JSONConfig(name: fname) {
		if let dict = configData.getValues() {

			// Required Values
			HTTPport = dict["httpport"] as! Int
		}
	} else {
		print("Unable to get Configuration")
	}

}
