module.exports = (client) => {
  console.log(`${client.user.username} is online.`);
	client.user.setActivity(client.config.activityStatus, { type: client.config.activityType })
};