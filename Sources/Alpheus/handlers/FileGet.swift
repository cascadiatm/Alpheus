import PerfectHTTP
import StORM

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
        var page = 0
        var limit = 10
        var count = 0
				do {
          for (param, value) in request.queryParams {
            if param == "page" {
              page = Int(value) ?? 0
            } else if param == "per_page" {
              limit = Int(value) ?? 10
            }
          }

          if page > 0 {
            let offset = (page - 1) * limit
            let cursor = StORMCursor(limit: limit, offset: offset)

            try files.select(
              columns: [],
              whereclause: "1",
      				params: [],
      				orderby: [],
      				cursor: cursor
            )
            count = files.results.cursorData.totalRecords
            //print("Total records \(files.results.cursorData)")
          } else {
  					// Basic findall method
  					try files.findAll()
          }
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
        var pagination: [String: Any] = [:]

        if page > 0 {
          pagination["total"] = count
          pagination["per_page"] = limit
          pagination["current_page"] = page
          pagination["last_page"] = count / limit
          pagination["next_page_url"] = nil
          pagination["prev_page_url"] = nil
          pagination["from"] = data[0]["id"]
          pagination["to"] = data[data.count - 1]["id"]
        }
				let _ = try? response.setBody(json: ["links":["pagination" : pagination], "data": data])
			}
            response.completed()
        }
    }
}
