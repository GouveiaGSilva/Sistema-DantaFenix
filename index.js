import express from 'express';
import session from 'express-session';

const app = express();
const porta = 3000;
const urlDb = "http://localhost:4000/"

express.urlencoded({extended : true });

app.use(session({
  secret: "MinhaChave",
  resave: false,
  saveUninitialized: true,
  cookie: { 
    secure: false, 
    maxAge : 60 * 60 * 60
  }
}));

app.use(express.static('/publico'));

app.get('/', (req, res)=>{
  res.send("Em manutenção");
})

app.listen( porta , ()=>{
  console.log(`Servidor iniciado na porta ${porta}`);
})