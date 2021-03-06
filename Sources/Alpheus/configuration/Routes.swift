//
//  Routes.swift
//  staffDirectory
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
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
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTPServer

func mainRoutes() -> [[String: Any]] {
    var routes: [[String: Any]] = [[String: Any]]()
    routes.append(["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles, "documentRoot":"./webroot","allowResponseFilters":true])

    /// List all files
    routes.append(["method":"get", "uri":"/api/admin/gdelt/v2/file", "handler":Handlers.fileGet])

    /// Return specified file
    routes.append(["method":"get", "uri":"/api/admin/gdelt/v2/file/{id}", "handler":Handlers.fileGet])

    /// Ingest the specified file
    routes.append(["method":"patch", "uri":"/api/admin/gdelt/v2/file/{id}", "handler":Handlers.fileIngest])

    /// Update specified record
    //routes.append(["method":"patch", "uri":"/api/v1/person/{id}", "handler":Handlers.personUpdate])

    /// Delete specified record
    //routes.append(["method":"delete", "uri":"/api/v1/person/{id}", "handler":Handlers.personDelete])

    return routes
}
