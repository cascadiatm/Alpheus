import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectRequestLogger
import PerfectLogger
import SQLiteStORM

SQLiteConnector.db = "./alpheus"

var HTTPport = 8181
config()
Utility.initializeObjects()

let httplogger = RequestLogger()
RequestLogFile.location = "./webLog.log"

// Configure Server
var confData: [String:[[String:Any]]] = [
	"servers": [
		[
			"name":"localhost",
			"port":HTTPport,
			"routes":[],
			"filters":[]
		]
	]
]

// Load Filters
confData["servers"]?[0]["filters"] = filters()

// Load Routes
confData["servers"]?[0]["routes"] = mainRoutes()

do {
	// Launch the servers based on the configuration data.
	try HTTPServer.launch(configurationData: confData)
} catch {
	 // fatal error launching one of the servers
	fatalError("\(error)")
}
