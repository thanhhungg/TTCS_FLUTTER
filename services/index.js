console.log("hello  world");
const mongoose = require("mongoose");
const express = require("express");
const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://hung:123@cluster0.wafztr7.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);


//connect
mongoose.connect(DB).then(() => {console.log("connected successful");}).catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log("server running on", PORT);
});
