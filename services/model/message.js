const mongoose = require('mongoose');
const messagesSchema = mongoose.Schema({
    id:{
        require:true,
        type:String,
    },
    name:{
        require:true,
        type:String,
    },
    text:{
        require:true,
        type:String,
    },
    image:{
        require:true,
        type:String
    },
    time:{
        require:true,
        type:String,
    },
    isSender:{
        require:true,
        type:String,
    },
    position:{
        require:true,
        type:String,
    }
});
const Messages = mongoose.model(
    "messages",
    messagesSchema
);
module.exports = Messages;