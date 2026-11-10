const form = document.querySelector('#story-form');
const state = document.querySelector('#state');
const message = document.querySelector('#message');
const status = document.querySelector('#status');

for (const uf of 'AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO'.split(' ')) {
  state.add(new Option(uf, uf));
}

message.addEventListener('input', () => {
  message.setCustomValidity('');
  status.textContent = '';
});

form.addEventListener('submit', (event) => {
  event.preventDefault();
  const relato = message.value.trim();
  if (!relato) {
    message.setCustomValidity('Escreva seu relato antes de salvar.');
    message.reportValidity();
    return;
  }

  try {
    const key = 'luugar.relatos';
    const saved = JSON.parse(localStorage.getItem(key) ?? '[]');
    const fields = Object.fromEntries(new FormData(form));
    saved.push({ ...fields, cidade: fields.cidade.trim(), relato });
    localStorage.setItem(key, JSON.stringify(saved));
    form.reset();
    status.textContent = 'Relato salvo neste navegador.';
  } catch {
    status.textContent = 'Não foi possível salvar neste navegador. Seu texto continua no formulário.';
  }
});
