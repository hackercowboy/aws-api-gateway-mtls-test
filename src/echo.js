module.exports.echo = async (event) => ({
  statusCode: 200,
  body: `Hello, ${event.headers['x-subject']}!`,
});
