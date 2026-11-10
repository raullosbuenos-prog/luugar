const form = document.querySelector('#lead-form');
const status = document.querySelector('#lead-status');

form.addEventListener('submit', event => {
  event.preventDefault();
  const fields = Object.fromEntries(new FormData(form));
  const key = 'luugar.leads';
  try {
    const leads = JSON.parse(localStorage.getItem(key) || '[]');
    leads.push({ ...fields, criadoEm: new Date().toISOString() });
    localStorage.setItem(key, JSON.stringify(leads));
    form.reset();
    status.textContent = 'Pronto! Seu interesse ficou registrado neste navegador.';
  } catch {
    status.textContent = 'Não foi possível salvar agora. Seus dados continuam no formulário.';
  }
});
