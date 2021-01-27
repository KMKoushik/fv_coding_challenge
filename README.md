# JSON Object Similarity Score

Write a program that will compare two json objects and give a score between 0 and 1 as to how similar they are, a score of 1 meaning the objects are identical. There are sample JSON files in the data directory for testing.

# Solution

## Start the server

- Move to `json` folder.

```sh
cd json
```

- Install dependencies.

```sh
bundle install
```

- Start rails app

```sh
rails s
```

## Important files

app/service/json_service.rb - This is where the actual calculation occurs
app/controllers/compare_controller.rb & app/views/compare/index.html.erb

Results are rounded to 2 decimal places.

![Alt text](./SS.png)
