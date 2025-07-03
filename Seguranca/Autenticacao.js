export default function verificaLogin(req ,res ,next){
  if(req.session.autenticado)
    next()
  else
    res.redirect('/');
}