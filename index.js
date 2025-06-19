const app = express();
const porta = 3000;
const urlDb = "http://localhost:4000/"

app.use(express.encodeURI({extended : true }));

app.use(session({
  secret: "MinhaChave",
  resave: false,
  saveUninitialized: true,
  cookie: { 
    secure: false, 
    maxAge : 60 * 60 * 60
  }
}));

