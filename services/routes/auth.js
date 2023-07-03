const express = require("express");
const User = require("../model/user");
const Notification=require("../model/notification");
const NotificationAdmin=require("../model/notification_admin");
const Messages=require("../model/message");
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { Db } = require("mongodb");


authRouter.post("/api/signup", async (req, res) => {
  try {
    const { username, password } = req.body;
    const exitstingUser = await User.findOne({ username });
    if (exitstingUser) {
      return res.status(400).json({ message: "Đã tìm thấy tài khoản" });
    }
    const hashedPassword= await bcryptjs.hash(password,8);
    let user = new User({
      username,
      password:hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { username, password } = req.body;
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(400).json({ message: "Không tồn tại tài khoản" });
    }
    const isMath = await bcryptjs.compare(password, user.password);
    if(!isMath) {
      return res.status(400).json({ message: "Sai mật khẩu" });
    }
    const token = jwt.sign({id: user._id},"passwordKey");
    res.json({token,...user._doc});

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
authRouter.get("/api/notification",async (req,res)=>{
   try{
    Notification.find({}).then(function(data){
      res.json(data);
  })
   }catch(e){
    res.status(500).json({ error: e.message });
   } 
});
authRouter.get("/api/notification_admin",async (req,res)=>{
  try{
    NotificationAdmin.find({}).then(function(data){
      res.json(data);
  })
   }catch(e){
    res.status(500).json({ error: e.message });
   } 
})
authRouter.get("/api/messages",async (req,res)=>{
  try{
    Messages.find({}).then(function(data){
      res.json(data);
  })
   }catch(e){
    res.status(500).json({ error: e.message });
   } 
})
// authRouter.pop("/api/notification_admin",async (req,res)=>{
//   try{
//     NotificationAdmin.find({}).then(function(data){
//       res.json(data);
//   })
//    }catch(e){
//     res.status(500).json({ error: e.message });
//    } 
// })
module.exports = authRouter;
