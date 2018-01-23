//===----------------------------------------------------------------------===//
// Mapper.swift
// 
// This source file is part of the Alpheus open source project
// 
// Copyright (c) 2018 Chris Daley <chebizarro@gmail.com>
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// 
// See http://www.apache.org/licenses/LICENSE-2.0 for license information
//
//===----------------------------------------------------------------------===//

public protocol Mapper<KEYIN, VALUEIN, KEYOUT, VALUEOUT> {
	
	func cleanup(context: Context)
	
	func map(key: KEYIN, value: VALUEIN, context: Context)
	
	func run(context: Context)
	
	func setup(context: Context)
}