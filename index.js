import { error } from 'console';
import express from 'express';
import session from 'express-session';

const app = express();
const porta = 3000;
const urlDb = "http://localhost:4000/"


app.use(express.urlencoded({ extended: true }));

app.use(session({
  secret: "MinhaChave",
  resave: false,
  saveUninitialized: true,
  cookie: { 
    secure: false, 
    maxAge : 60 * 60 * 60
  }
}));

app.use(express.static('./publico'));

app.get('/', (req, res)=>{
  res.redirect('/index.html');
})

app.post('/login', (req, res)=>{
  const {email , senha} = req.body;
  fetch(`${urlDb}/Cadastros?email=${email}`,)
  .then((resp)=>{
    if(resp.ok)
      return resp.json();
    console.log('erro de requisição' + resp.status);
    return ;
  })
  .then((data)=>{
    if(data.length > 0){
      if(data[0].senha === senha){
        req.session.login = true;
        if(data[0].cargo === "tocador")
          return res.redirect('/menuTocador.html');
        else
          return res.redirect('/menuAdm.html');
      }
    }
    else{
      
      return console.log("senha errada");
    }
  })
  .catch((error)=>{
    console.error("Erro:" + error);
  })
});

app.listen( porta , ()=>{
  console.log(`Servidor iniciado na porta ${porta}`);
})