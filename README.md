<br />
<p align="center">

  <a href="https://github.com/vanheaven-ui/bible.nav-ui">

  <img src="logo/logo.png" alt="Logo" width="80" height="80">

  </a>

  <h3 align="center">Bible.nav Backend API</h3>

  <p align="center">
    The back end of the Bible.nav application.
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    .
    <a href="https://github.com/vanheaven-ui/bible.nav-api/issues">Report Issue</a>
    ·
    <a href="https://github.com/vanheaven-ui/bible.nav-api/issues">Request Feature</a>
  </p>
</p>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#installation">Installations</a></li>
        <li><a href="#run">Run</a></li>
      </ul>
    </li>
    <li><a href="#tests">Testing</a></li>
    <li><a href="#author">Author</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)


The API developed in this project serves to expose 7 endpoints to the user interface built using React with the main objective of fulfilling the full-stack web development requirements for the final capstone study project at [Microverse Inc](https://www.microverse.org/). The project specificifications were explicit on using RAILS for the development and the use of code linters while ensuring proper Git workflow.

### Endpoints

The following endpoints are exposed for use with the [front end application here](https://github.com/vanheaven-ui/bible.nav-ui).

The base URL is: https://biblenav-api.herokuapp.com

 | VERB/METHOD |               PATH              |     PURPOSE     |             REQUIRED PARAMETERS(Body)              |
 | ----------- | ------------------------------- | --------------- | -------------------------------------------------- |
 |    POST     | /api/v1/signup                  |   User signup   | username, email, password, password_confirmation   |
 |    POST     | /api/v1/login                   |   User login    |                  username, password                |
 |    GET      | /api/v1/users/:id               | Logged in user  |                                                    |
 |    GET      | /api/v1/users/:id/favorites     |  get favorites  |                                                    |
 |    GET      | /api/v1/users/:id/favorites/:id |  get favorite   |                                                    |
 |    POST     | /api/v1/users/:id/favorites     |  Add favorite   |      book_name, chapter_num, verse_num, verse      |
 |   DELETE    | /api/v1/users/:id/favorites/:id | Remove favorite |                                                    |
 
 For the detailed documentation, [click here](https://documenter.getpostman.com/view/15394592/TzRSh7rx)
 
### Built With

Below is a list of the tools used to complete this project.
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ensure you have the following running in your local environment.
* ruby '2.7.2' or greater
  <br />

  [Visit:](https://www.ruby-lang.org/en/downloads/)

* Rails 6.1.3.1 or greater
  <br>

  [Visit:](https://guides.rubyonrails.org/v5.0/getting_started.html)

### 🔨 Setup <a name = "setup"></a>

To get a copy of the project on your computer:

- Clone or download the repository to a local directory on your computer by following the Github instructions at [Github clone/download repository](https://docs.github.com/en/enterprise/2.13/user/articles/cloning-a-repository).
<br />
Forexample: 
  + Navigate to a folder where you want the project to reside
  + Run the following command in the terminal
```sh
  git clone https://github.com/vanheaven-ui/bible.nav-api.git
```

### 🛠 Installing <a name = "installation"></a>

Once you have a local copy of the entire project on your computer, then:

- Open the project directory in your editor of choice. For example running `code .` will open the project in VSCode.
- Run `bundle install` to install the project dependencies resident in the Gemfile.

### Run <a name = "run"></a>

With the installations above complete, you are set to locally use the code. Follow these simple steps:

- Run `rails s` or `rails server` to start the Rails server.
- If everything worked well, type `http://localhost:3000/` in the browser and you should get the index page of the application.

## 🧪 Testing <a name= "tests"></a>

### Tools

The following tools were used to write the tests for the API.

- Rspec
- FactoryBot
- Faker

### Test Run

To run the tests, simply type:
- `bundle exec rspec` or `rspec` in the terminal and hit enter. This will run tests.

## ✒️ Author <a name = "author"></a>

👤 **Mworekwa Ezekiel**

- Github: [@vanheaven-ui](https://github.com/vanheaven-ui)
- Twitter: [@MworekwaE](https://twitter.com/MworekwaE)
- Linkedin: [@linkedin](https://www.linkedin.com/in/vanheaven/)
- Email: [ezekiel](mailto:vanheaven6@gmail.com)

## 🤝 Contributing <a name = "contributing"></a>

Contributions, issues and feature requests are welcome!

- To create an issue, visit the [issues page](https://github.com/vanheaven-ui/bible.nav-api/issues) and create a new issue.
- To contribute to the code base, follow the steps below:
  1. Fork this repository to your remote respository by clicking the Fork button in this repository.
  2. Clone this repository to a directory on your computer by following Github guidelines.
  3. Change directory into the directory where you cloned this repository to.
  4. Open the directory using your favorite editor.
  5. Create a feature branch off the develop branch.
  6. Make and commit the nuanced code.
  7. Open a pull request describing the improvements made
     And your reward awaits in heaven.

## 👍 Show your support

Give a ⭐️ if you like this project!

## :clap: Acknowledgements <a name = "acknowledgements"></a>

- [Microverse Community](https://www.microverse.org/) <br />
- [React Official Documentation](https://reactjs.org/)
