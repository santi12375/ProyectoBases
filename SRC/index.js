const express = require ('express');
//const mongoose = require('mongoose');
//mongoose.connect('mongodb+srv://admin:<admin>@cluster0.7wyyd.mongodb.net/Cluster0?retryWrites=true&w=majority');
const path = require('path');

const app = express();

// middlewares
app.use(express.json()); //for understand json
app.use(express.urlencoded({extended:false})); //for understand simple data of forms
//app.use(express.static('http://127.0.0.1:5500/SRC/CSS/styles.css'));

// Para tomar el html
app.use(express.static(path.join(__dirname,'./public')))

//Routes
app.use(require('./routes/urls'));

app.listen(3000);
console.log('Server on port 3000');
