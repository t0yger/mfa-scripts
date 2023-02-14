import getToken from "totp-generator";

function main() {
  if (!process.env.MFA_SECRET_KEY) {
    throw new Error("required set MFA_SECRET_KEY");
  }
  const token = getToken(process.env.MFA_SECRET_KEY);
  console.log(token);
}

main();
