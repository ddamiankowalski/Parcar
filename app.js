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
    console.log(`Example app listening on port ${port}`);
});

app.get("/", (req, res) => {
    res.json({ message: "ok" });
});



