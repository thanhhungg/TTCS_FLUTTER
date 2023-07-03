const mongoose = require("mongoose");
const  notificationSchema= mongoose.Schema({
    eventDate:
    {
        required:true,
        type:String, 
    },
    time:
    {
        required:true,
        type: String
    },
    title:{
        required:true, 
        type:String
    },
    subtitle:{
        required:true, 
        type:String
    }
},{
    collection:'notification'
});
const Notification=mongoose.model('notification', notificationSchema);
module.exports=Notification;

