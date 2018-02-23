//
// //  initializeObjects.swift // import PerfectLib import PerfectCURL

extension Utility {

	static func initializeObjects() {

        let a0 = File()

				try? a0.setup()

        //let url = "http://data.gdeltproject.org/gdeltv2/masterfilelist-translation.txt"
        let url = "http://data.gdeltproject.org/gdeltv2/lastupdate-translation.txt"

				downloadFile(url: url) {
					data in

					if let bodyString = String(bytes: data, encoding: .utf8) {

        		let filesContent: [String] = bodyString.components(separatedBy:"\n")

						for line in filesContent {
							let data: [String] = line.components(separatedBy:" ")

              if data.count == 3 {
								try? _ = a0.insert( cols: ["size", "md5", "url" ], params: data )
							}
						}
					}
				}
			}
}
