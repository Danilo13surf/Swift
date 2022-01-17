import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

struct CountryInfo: Codable {
    let iso2: String
    let flag: String
}

struct Response: Codable {
    let country: String
    let cases: Int
    let todayCases: Int
    let countryInfo: CountryInfo
    
}

if let url = URL(string: "https://corona.lmao.ninja/v3/covid-19/countries/Brazil") {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            do {
                let res = try JSONDecoder().decode(Response.self, from: data)
                
            } catch let error {
                print(error)
            }
        }
    }.resume()
}
