# Health Counsel API

Health Counsel Api is a RESTful API that allows authenticated users to get appointments with doctors with different specialty for treatments or counsel.

## Live Version

[Live Version](https://healthcounsel-api.herokuapp.com/)

## Getting Started

Clone the repository into your local computer.

```
$ git clone https://github.com/Elijahscriptdev/Health_Counsel_Api.git
```

### Installing

#### Pre requirements

* Ruby 2.7.1
* Rails 6.0.3

#### Start installation

Install all gems:

```
$ bundle install
```

Start API development server

```
$ rails s
```

### Testing

Run test command

```
$ bundle exec rspec
```


## API Documentation

### Signup User
  Returns an authentication token to authorize the subsequent resquests.

* **URL**
  /signup

* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `name=[string]` 
   `email=[string]` 
   `password=[string]` 
   `password_confirmation=[string]`

* **Success Response:**
  * **Code:** 201
	  **Content:** `{ auth_token: JWT_GENERATED_TOKEN }`

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing any of the required fields" }`

* **Sample Call:**
  ```javascript
	axios.post("/signup", {
	    name: 'Willam Smith',
	    email: williamsmith@mail.com,
	    password: 123456,
	    password_confirmation: 123456,
	  })
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Login User
  Returns an authentication token to authorize an existing user.

* **URL**
  /auth/login
* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `email=[string]` `password=[string]`

* **Success Response:**
  * **Code:** 200
	  **Content:** `{ auth_token: JWT_GENERATED_TOKEN }`

* **Error Response:**
  * **Code:** 401
    **Content:** `{ message: "Invalid Credentials" }`

* **Sample Call:**
  ```javascript
	axios.post("/auth/login",
	  {
	    email: williamsmith.com,
	    password: 123456,
	  }
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Create appointments
  Returns a json data of the created appointments

* **URL**
  /appointments
* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `meeting_info=[string]` 
   `date=[decimal]` 
   `time=[integer]` 
   `doctor_id=[integer]` 
   `user_id=[integer]`

* **Success Response:**
  * **Code:** 201
	  **Content:** `{ Appointment id: 1, meeting_info: "feeling tensed and stressed", date: "9/09/2020", time: "2:00", doctor_id: 1, user_id: 1, created_at: "2020-09-03 23:45:38", updated_at: "2020-09-03 23:45:38" }`

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Validation failed: any of the required fileds are not present" }`
    
* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing token" }`

* **Sample Call:**
  ```javascript
	axios.post("/appointments",
	  { Appointment id: 1,
       meeting_info: "feeling tensed and stressed",
        date: "9/09/2020",
         time: "2:00", 
         doctor_id: 1, 
         user_id: 1
      },
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))

### Get Appointments
  Returns a json data of all appointments that belongs to the authenticated user

* **URL**
  /appointments
* **Method:**
  `GET`

* ** URL Params**
  None
 
 * **Data Params**
  None

* **Success Response:**
  * **Code:** 200
	  **Content:** `[
    {
        "id": 2,
        "meeting_info": "feeling tensed and stressed",
        "date": "9/09/2020",
        "time": "2:00",
        "doctor_id": 2,
        "user_id": 3,
        "created_at": "2020-09-03T09:10:18.158Z",
        "updated_at": "2020-09-03T09:10:18.158Z",
        "doctor": {
            "id": 2,
            "name": "Moses",
            "specialty": "Pediatry",
            "hospital": "Ore Ofe Hospital",
            "age": "36",
            "experience_level": "Advance",
            "created_at": "2020-09-03T09:09:27.883Z",
            "updated_at": "2020-09-03T09:09:27.883Z"
        }
    }
]	  `

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing token" }`

* **Sample Call:**
  ```javascript
	axios.get("/appointments",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

  ### Get Doctors
  Returns a json data of all Doctors that belongs to different specialty

* **URL**
  /doctors
* **Method:**
  `GET`

* ** URL Params**
  None
 
 * **Data Params**
  None

* **Success Response:**
  * **Code:** 200
	  **Content:** `[
        {
        id: 1,
        name: "Tasha",
        specialty: "Pediatry",
        hospital: " lue Wave Hospital",
        age: "45",
        experience_level: "Advance",
        created_at: "2020-09-03T22:34:26.652Z",
        updated_at: "2020-09-03T22:34:26.652Z"
        },
        {
        id: 2,
        name: "Moses",
        specialty: "Optometry",
        hospital: " re Ofe Hospital",
        age: "36",
        experience_level: "Advance",
        created_at: "2020-09-03T22:36:43.293Z",
        updated_at: "2020-09-03T22:36:43.293Z"
        },
        {
        id: 3,
        name: "Victor",
        specialty: "Cardiologists",
        hospital: "Lifeline Hospital",
        age: "41",
        experience_level: "Advance",
        created_at: "2020-09-03T22:40:56.583Z",
        updated_at: "2020-09-03T22:40:56.583Z"
        }
    ]	  `

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing token" }`

* **Sample Call:**
  ```javascript
	axios.get("/doctors",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Get specific Doctor
  Returns a json data of a specific doctor

* **URL**
  /doctors/:id
* **Method:**
  `GET`

* ** URL Params**
   **Required:**
   `id=[integer]`
 
 * **Data Params**
	None

* **Success Response:**
  * **Code:** 200
	  **Content:** `{
id: 1,
name: "Tasha",
specialty: "Pediatry",
hospital: " lue Wave Hospital",
age: "45",
experience_level: "Advance",
created_at: "2020-09-03T22:34:26.652Z",
updated_at: "2020-09-03T22:34:26.652Z"
}`

* **Error Response:**
  * **Code:** 404
    **Content:** `{ message: "Couldn't find doctor with 'id'=ID" }`
 
* **Sample Call:**
  ```javascript
	axios.get("/doctors/:id",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))

### Delete Doctor
  Returns a json data of a specific doctor

* **URL**
  /doctors/:id
* **Method:**
  `DELETE`

* ** URL Params**
   **Required:**
   `id=[integer]`
 
 * **Data Params**
	None

* **Success Response:**
  * **Code:** 204
	  **Content:** `empty`

* **Error Response:**
  * **Code:** 404
    **Content:** `{ message: "Couldn't find doctor with 'id'=ID" }`
 
* **Sample Call:**
  ```javascript
	axios.delete("/ddoctors/:id",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))


## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Programming language used
* [Ruby on Rails](https://rubyonrails.org/) - Framework

## Author

👤 **Elijah Obominuru**

[Github](https://github.com/Elijahscriptdev) | [Twitter](https://twitter.com/ElijahObominuru) | [LinkedIn](https://www.linkedin.com/in/elijah-obominuru-0b730b143/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is licensed under MIT license - see [LICENSE](/LICENSE) for more details.
