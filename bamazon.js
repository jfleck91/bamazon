var mysql = require("mysql");
var inquirer = require("inquirer");
// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "George91",
  database: "bamazon_DB"
});

connection.connect(function (err) {
  if (err) throw err;
  // run the function after the connection is made to prompt the user
  buyItem();
});

function buyItem() {
  // query the database for all items being sold
  connection.query("SELECT * FROM products", function (err, results) {
    if (err) throw err;
    var choicesArr = []
    for (var i = 0; i < results.length; i++) {
      choicesArr.push(results[i].product_name) }
    // once you have the items, prompt the user for which they'd like to buy
    inquirer
      .prompt([
        {
          name: "items",
          type: "list",
          choices: choicesArr,
          message: "What item number would you like to buy?"
        },
        {
          name: "quantity",
          type: "input",
          message: "How many would you like to buy?"
        }
      ])
      .then(function (answer) {
        // get the information of the chosen item
        var chosenItem="";
        for (var i = 0; i < results.length; i++) {
          if (results[i].product_name === answer.items) {
            chosenItem = results[i];
          }
        }
        console.log(chosenItem.quantity);
        console.log(answer.quantity);
        // determine if you have enough 
        if (chosenItem.quantity > answer.quantity) {
          // bid was high enough, so update db, let the user know, and start over
          connection.query(
            "UPDATE Products SET ? WHERE ?",
            [
              {
                quantity: answer.quantity
              },
              {
                id: chosenItem.id
              }
            ],
            function (error, results) {
              if (error) throw err;
              console.log("Thank you for your purchase!");
              connection.end();
            }
          );
        }
        else {
          // bid wasn't high enough, so apologize and start over
          console.log("We dont have enough of this item. Try again...");
          connection.end();
        }
      });
  });
}
