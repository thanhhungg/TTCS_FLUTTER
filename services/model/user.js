const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
    username:{
        required:true,
        type:String,
        // trim:false
    },
    password:{
        required:true,
        type:String,
    }
});
const User =mongoose.model('User', userSchema);
module.exports =User;
