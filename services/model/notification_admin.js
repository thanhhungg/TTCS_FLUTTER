const mongoose = require("mongoose");
const notificationAdminSchema = mongoose.Schema({
  name: {
    require: true,
    type: String,
  },
  title: {
    require: true,
    type: String,
  },
  subtitle: {
    require: true,
    type: String,
  },
  time: {
    require: true,
    type: String,
  },
  date: {
    require: true,
    type: Date,
  },
  avt: {
    type: String,
  },
});
const NotificationAdmin = mongoose.model(
  "notificationadmin",
  notificationAdminSchema
);
module.exports = NotificationAdmin;
