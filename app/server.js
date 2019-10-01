var express = require("express");
var path = require("path");
var bodyParser = require("body-parser");

var keys = require("./keys.js");
require("dotenv").config();


var mysql = require("mysql");
var connection = mysql.createConnection(keys.data);




var app = express();
var PORT = process.env.PORT || 3000;
var friends = [];



app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static(path.join(__dirname, '/app/public')));


//connect with mysql and pull off data

connection.connect(function (err) {
  if (err) {
    console.error("Unable to connect  " + err.stack);
  }
  console.log("You are connected to ffirnders_db");
});

//index route
app.get("/", function (req, res) {
  res.render("index");
})

//survey page
app.get("/survey", function (req, res) {
  connection.query("SELECT * FROM questions", function (err, response) {
    res.render("survey", { res: response });
  })
})


//GET request to pull off data with a loop for each friend in the db
app.get("/app/friends", function (req, res) {
  connection.query("SELECT f.friend_name, f.image_url, GROUP_CONCAT(s.score) AS scores FROM scores s JOIN friends f USING (friend_id) GROUP BY friend_id", function (err, response) {
    var friends = [];
    for (var i = 0; i < response.length; i++) {
      var friend = {};
      friend.name = response[i].friend_name;
      friend.link = response[i].image_url;
      friend.scores = [];
      for (var x = 0; x < response[i].scores.length; x++) {
        if (response[i].scores[x] != ",")
          friend.scores.push(response[i].scores[p]);
      }

      //  //-- now calculate the oppositesScore which is  --//
      //       //-- totalDifference between the friend scores and the users scores --//
      //       //-- The less difference, the more compatible --//
      //       for (var y=0; y<friends[x].scores.length; y++) {
      //         totalDifference += Math.abs(parseInt(userScores[y]) - parseInt(friends[x].scores[y]));

      //         if (totalDifference <= match.oppositesScore) {
      //             match.closestMatch = friends[x];
      //             match.oppositesScore = totalDifference;
      //             //console.log("The new best match is " + match.closestMatch.name + " with a friend score of: " + totalDifference + "\n");
      //         } 
      //     }
      friends.push(friend);
    }
    res.json(friends);
  })
});

app.post("/app/friends", function (req, res) {
  var name = req.body.firstname + " " + req.body.lastname;
  var link = req.body.url;
  var scores = [
    parseInt(req.body.question1),
    parseInt(req.body.question2),
    parseInt(req.body.question3),
    parseInt(req.body.question4),
    parseInt(req.body.question5),
    parseInt(req.body.question6),
    parseInt(req.body.question7),
    parseInt(req.body.question8),
    parseInt(req.body.question9),
    parseInt(req.body.question10),
  ];


  connection.query("INSERT INTO friends(friend_name, image_url) VALUES (?, ?)", [name, link], function (err, res) {
    addNewFriend(name, link);
  });

  function addNewFriend(str, link) {
    connection.query("SELECT friend_id FROM friends WHERE friend_name = ? AND image_url=?", [str, link], function (err, res) {
      addScore(res[0].friend_id);
    });
  };

  function addScore(num) {
    connection.query("INSERT INTO scores (friend_id, question_id, score) VALUES (?,1,?), (?,2,?), (?,3,?), (?,4,?), (?,5,?), (?,6,?), (?,7,?), (?,8,?), (?,9,?), (?,10,?)", [num, scores[0], num, scores[1], num, scores[2], num, scores[3], num, scores[4], num, scores[5], num, scores[6], num, scores[7], num, scores[8], num, scores[9]], function (err, res) {
      calculateDiff(num);
    });
  };

  function calculateDiff(num) {
    connection.query("SELECT * FROM (SELECT SUM(score_difference) ans_diff_total, friend_id, t2friend_id FROM (SELECT question_id, friend_id, t2friend_id, score_difference FROM  (SELECT *, ABS(score-t2score) AS score_difference FROM (SELECT * FROM scores s1 LEFT JOIN (SELECT question_id AS t2question_id, friend_id AS t2friend_id, score AS t2score FROM scores s2) t2 ON t2question_id = s1.question_id) t3) t4) t5 GROUP BY t2friend_id, friend_id) t6 LEFT JOIN friends  ON t2friend_id = friends.friend_id WHERE t6.friend_id = ? ORDER BY ans_diff_total", [num], function (err, results) {
      res.render("result", { name: results[1]["friend_name"], link: results[1]["image_url"] });
    });
  };


  //Start a server
  app.listen(PORT, function () {
    console.log("App is listening on PORT " + PORT);
  });