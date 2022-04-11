module.exports.authorize = async (event) => {
  if (event.requestContext.authentication && event.requestContext.authentication.clientCert) {
    const subject = event.requestContext.authentication.clientCert.subjectDN;
    return {
      isAuthorized: true,
      context: {
        subject,
      },
    };
  }
  return {
    isAuthorized: false,
  };
};
