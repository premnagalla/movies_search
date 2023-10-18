# README

## Versions:
- Ruby version: 3.0
- Rails version: 7.1

### Configuration
- Created "tmdb_keys.yml" file, to store application keys. Please request this from Team members to use it/You can register with TMDB for keys and add new file with your credentials.

### Setup commands
- `rails db:create db:migrate` to prepare the base schema
- `rails s` to run the application in local and access application from browser at `http://localhost:3000`

### Implementation & Scenarios handled
- Saving searched movie data into local Database, to avoid future repeated queries for same movies
- Implemented pagination for local movies as well as TMDB results. We are saving only the pages which user is accessing from TMDB results pagination.
- By default, implemented the search to look locally and if there are no results in local, we are searching from TMDB.
- Also added the option to directly search from TMDB data, if user wants.
- Displaying Flash notification, to show the source of the data(Local/TMDB API) and result of the Search.
- For API, default per page count is 20 and we are not getting the option to change this per page value. Implemented custom pagination filter for local data to change per_page count, with default value of 20.
- Adding test suit, implementing front end framework(ex: ReactJS/others) for better UI experience, to show movie's full details in a popup modal and fine tuning the UI can be the next steps in implementation when time permits.
