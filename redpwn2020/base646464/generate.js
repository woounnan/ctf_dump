const btoa = str => Buffer.from(str).toString('base64');
const atob = str => Buffer.from(str, 'base64').toString('ascii')

const fs = require("fs");
const flag = fs.readFileSync("cipher.txt", "utf8").trim();

let ret = flag;
for(let i = 0; i < 25; i++) ret = atob(ret);

fs.writeFileSync("dec.txt", ret);
