# Test for backend engineer EvHive

## Challenge

OFFLINE CODE Testing

Duration Offline : (max) 1 weeks
Next Step (Success Flow) : Interview + Done

I) Instructions

    1. Create Simple Product Cart& Product Page - Wireframe attached Acceptance Criteria :
        1. The Project should use golang 
        2. The Project should be able to handle any of file upload
        3. The User should be able to update their own shopping cart

        NB : Just use the static declaration of data

    2. Kindly program these in :
        Backend : Golang REST API
        *Frontend : No Need
        **Acceptance Testing : golang unit testing,  etc.

II) Our Priorities :

    1. Database modelling
    2. API routing/access pattern& JSON schema (keywords : Code Structure, Code Styling, Folder Structure)
    3. Automated Unit Testing
    4. Functionalities
        (keywords : Auth JWT, File Upload, Cart System)

III) Submission :

    1. Project Files
    2. README file to install & run (or could be in the form of accessible remote Repositories)

## How to install

1. Install go language
2. Install postgres
    1. Create a new schema with `evhivecart`
    2. Import data in folder doc/dump
3. open console in project directori and then typing `cd cmd/cartd`
4. Make sure the .env is right
5. typing  `go get -v`
6. typing `go run .\main.go .\app.go` or `go build && ./cartd`
7. using postman for testing and import collection in doc/postman