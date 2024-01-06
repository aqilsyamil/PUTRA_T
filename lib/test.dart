import 'package:mysql_client/mysql_client.dart';

Future<void> main(List<String> arguments) async {
  print("Connecting to mysql server...");

  // create connection
  final conn = await MySQLConnection.createConnection(
    host: "localhost",
    port: 3306,
    userName: "root",
    password: "password",
    databaseName: "putra_t", // optional
  );

  await conn.connect();

  print("Connected");

  // update some rows
  var res = await conn.execute(
    "UPDATE book SET price = :price",
    {"price": 200},
  );

  print(res.affectedRows);

  // insert some rows
  res = await conn.execute(
    "INSERT INTO book (author_id, title, price, created_at) VALUES (:author, :title, :price, :created)",
    {
      "author": null,
      "title": "New title",
      "price": 200,
      "created": "2022-02-02",
    },
  );

  print(res.affectedRows);

  // make query
  var result = await conn.execute("SELECT * FROM book");

  // print some result data
  print(result.numOfColumns);
  print(result.numOfRows);
  print(result.lastInsertID);
  print(result.affectedRows);

  // print query result
  for (final row in result.rows) {
    // print(row.colAt(0));
    // print(row.colByName("title"));

    // print all rows as Map<String, String>
    print(row.assoc());
  }

  // close all connections
  await conn.close();
}