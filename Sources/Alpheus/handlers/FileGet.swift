import PerfectHTTP

extension Handlers {
    /// API endpoint for handling the fetch of a record, or a list
    static func fileGet(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

			// Initial stub object.
			// Holds either the individual response, or the list response
			let files = File()

			// Look for {id} url var in request
			if let id = request.urlVariables["id"] {
				do {
					// Set id via "get" method (aka "Find")
					try files.get(Int(id) ?? 0)

					// If id is populated, then we have a successful fetch
					if files.id > 0 {
						let _ = try? response.setBody(json: files.asDataDict())
					} else {
						// Otherwise, exit out of the request
						throw(ErrorCode.invalidRequest)
					}
				} catch {
					// Return an error specifying ID fetch failed
					Handlers.error(request, response, error: "Incorrect ID", code: .badRequest)
					return
				}
			} else {
				// Execute a list fetch
				do {
					// Basic findall method
					try files.findAll()
				} catch {
					// Return an informative error
					Handlers.error(request, response, error: "\(error)", code: .badRequest)
					return
				}

				// Container for our processed results
				var data = [[String:Any]]()
				for obj in files.rows() {
					data.append(obj.asDataDict())
				}
				let _ = try? response.setBody(json: ["total":data.count, "per_page": 15, "data": data])
			}
            response.completed()
        }
    }
}
