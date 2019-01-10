# FavUsers
Lists random users in tableview

### Architecture: 
This project uses **MVVM** architecture.
## Network Layer: 
A modular and extendable network layer with the use of swift's native networking framework (No use of Alamofire or any other third party framework). The layer lets user choose different environments of execution to choose from. The modular approach makes the network code extendable with multiple source of API servers.
The network layer's ```APIClient.swift``` contains minimulistic code and Swift's generics allow extendibility making the same code usuabe irrespective of any kind of response from server. API-specific errors can also be handled and filtered down in, for example, ```UserRequests.swift file```.
## JSON Model Mapping:
The code uses Swift 4's Codable protocol for mapping JSON data to model in minimum lines of code

## Test Cases
The current code contain one test that validates JSON mapping of User object with a mock data file named ```User.json```.
The test case can be improved by downloading Users data and storing in the mock file once a day to reduce the cost of hitting the API repeatatively each time the test is run.

## Improvements:
Reactive programming libraries like **RxSwift** and test libraries like **Nimble** and **Quick** can be used but I didn't feel much need because it was a small task. The decision would have been a tradeoff between project size and advantage.


