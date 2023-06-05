# Dataset for Stack Overflow questions under the React Native tag

This dataset was retrieved using the [StackExchange Data Explorer](https://data.stackexchange.com/stackoverflow/query/new), with the following query:

```sql
SELECT *
  FROM Posts as Questions
  WHERE
    Questions.PostTypeId = 1
    AND Questions.Tags LIKE ’%<react-native>%’
  ORDER BY Questions.Id DESC
```

This query filters the Stack Overflow questions under the react-native tag, and the result is a CSV table. Due to the StackExchange limits of 50.000 rows, it was necessary to run the query a few more times to retrieve all the React Native questions. The query was ordered by ID, and the following query searched for questions with an ID bigger than the previous query's last ID.

See that the query bellow searches for questions with IDs under `58759902`, that was the first query last ID.

```sql
SELECT *
  FROM Posts as Questions
  WHERE
    Questions.PostTypeId = 1
    AND Questions.Id < 58759902
    AND Questions.Tags LIKE ’%<react-native>%’
  ORDER BY Questions.Id DESC
```

It was necessary to run the query one more time. The last query searched for questions with ID under `40603514` using the script above.

Each query resulted in a CSV table that was downloaded. The three files were merged, creating one dataset with all react-native questions.

This dataset is at `tcc/so_questions.csv`.


