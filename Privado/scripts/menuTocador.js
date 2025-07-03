const urlDb = "http://localhost:4000";

  let ano=0;
  let apre = [];
  let dataAtual;
  let mesAtual;
  let anoAtual;
  let diaAtual;
  const setaP ='';
  const setaN ='';


async function getApre() {
  return fetch(`${urlDb}/Apresentacoes`)
    .then((res) => {
      if (res.ok) {
        return res.json();
      } else {
        console.log("Erro de requisição");
        return [];
      }
    })
    .then((data) => {
      if (data.length > 0)
        return data;
      else
        return [];
    })
    .catch((error) => {
      console.error("erro:" + error);
      return [];
    });
}



// Função para obter o nome do mês em português
function getNomeMes(mes) {
  const meses = [
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 
    'Maio', 'Junho', 'Julho', 'Agosto', 
    'Setembro', 'Outubro', 'Novembro', 'Dezembro'
  ];
  return meses[mes];
}


// Função principal para renderizar o calendário
async function  renderCalendario(som) {

  dataAtual = new Date();
  mesAtual =  Math.abs(dataAtual.getMonth() + som);
  anoAtual = dataAtual.getFullYear();
  diaAtual = dataAtual.getDate();
  apre = await getApre();

  let calendario = document.getElementById('calendario');

  // Atualiza o cabeçalho com mês e ano
  const headerElement = document.getElementById('mes-ano');
  headerElement.textContent = `${getNomeMes((mesAtual)%12)} ${anoAtual}`;

  // Primeiro dia do mês e quantidade de dias no mês
  const primeiroDiaDoMes = new Date(anoAtual, mesAtual, 1).getDay();
  const ultimoDiaDoMes = new Date(anoAtual, mesAtual + 1, 0).getDate();

  const tbody = document.getElementById('dias-calendario');
  tbody.innerHTML = ''; // Limpa conteúdo anterior

  let linha = document.createElement('tr');
  let diaContador = 1;

  // Adiciona células vazias antes do primeiro dia do mês
  for (let i = 0; i < primeiroDiaDoMes; i++) {
    const celulaVazia = document.createElement('td');
    linha.appendChild(celulaVazia);
  }

  let i=0;
  // Renderiza os dias do mês
  while (diaContador <= ultimoDiaDoMes) {
    if (linha.children.length === 7) {
      tbody.appendChild(linha);
      linha = document.createElement('tr');
    }

    const coluna = document.createElement('td');
    coluna.textContent = diaContador;

    // Marca o dia atual
    if (diaContador === diaAtual && mesAtual === dataAtual.getMonth()) {
      coluna.classList.add('dia-atual');
    }

    // Marca fins de semana
    const diaSemana = new Date(anoAtual, mesAtual, diaContador).getDay();
    if (diaSemana === 0 || diaSemana === 6) {
      coluna.classList.add('fim-de-semana');
    }

    for (const apresentacao of apre) {
      let mesApre = apresentacao.mes.toLowerCase();
      let mesAtualNome = getNomeMes((mesAtual)%12).toLowerCase();
      let anoApre = apresentacao.ano;
      if (apresentacao.dia === diaContador && mesApre === mesAtualNome && anoAtual == anoApre) {
        coluna.classList.add('dia-apresentacao');
        coluna.innerHTML = diaContador + '<br>' + apresentacao.horario; 
        coluna.style.color = "black";
        break; // já marcou, não precisa continuar
      }
    }



    linha.appendChild(coluna);
    diaContador++;
  }

  // Adiciona a última linha se necessário
  if (linha.children.length > 0) {
    tbody.appendChild(linha);
  }


  let div = document.getElementById('setas');
  div.innerHTML="";
  let seta="";

  if(!(anoAtual === 2025 && getNomeMes((mesAtual)%12).toLowerCase() === 'janeiro')){
  seta = `<button onclick="renderCalendario(${som-1})">anterior</button>` 
  }

  seta += `<button onclick="renderCalendario(${0})">Mês Atual</button>`

  if(!(anoAtual === 2025 && getNomeMes((mesAtual)%12).toLowerCase() === 'dezembro')){
    seta += `<button onclick="renderCalendario(${som+1})">proximo</button>`
  }
  
  div.innerHTML=seta;
}

// Renderiza o calendário quando a página carregar
document.addEventListener('DOMContentLoaded', renderCalendario(0));




