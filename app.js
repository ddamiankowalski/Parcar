const express = require("express");
const api = require('./api/api');

const app = express();
const port = 3000;

app.use(express.json());
app.use('/api', api);
app.use(
    express.urlencoded({
        extended: true,
    })
);

app.listen(port, () => {
    console.log(`The application has started listening on port: ${port}`);
});



