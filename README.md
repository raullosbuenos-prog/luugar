# LUUGAR

Protótipo de site e simulação de histórico de locação, em HTML, CSS e JavaScript.

## Abrir localmente

Abra `b.1/index.html` no navegador para ver a versão mais recente. Para testar navegação e armazenamento com uma origem local consistente, use um servidor estático na raiz do projeto, por exemplo, com Python instalado:

```sh
python -m http.server 8000 --bind 127.0.0.1
```

Depois acesse `http://localhost:8000/b.1/`.

## Conteúdo

| Caminho | Conteúdo |
| --- | --- |
| `/` | Landing original de escuta |
| `/b/` | Versão B preservada |
| `/b.1/` | Versão atual para inquilinos |
| `/b.1/score/` | Calculadora pública sem cadastro |
| `/b.1/score/cadastro.html` | Caminho da calculadora com cadastro local |
| `/c/` | Versão para imobiliárias preservada |
| `/remarketing/` | Landing de acesso direto |
| `/social/` | 12 artes, legendas e cronograma |
| `/validacao/` | Roteiros, critérios e tabela para testes acompanhados |

## Estado do MVP

O cadastro e o progresso da simulação ficam na sessão do navegador. Relatos e anexos são guardados no IndexedDB do navegador e podem ser apagados pela interface. Não há backend, autenticação ou recebimento de leads pela LUUGAR.

O score é experimental e autodeclarado: não prevê inadimplência, não garante aprovação e não dispensa garantias. Pesos e regras estão em [critérios do score](validacao/criterios-score.md).

Antes de divulgação pública com coleta de dados, conectar armazenamento persistente, preparar privacidade e segurança dos anexos e validar os fluxos de recebimento. Confira o [plano de validação](validacao/plano-validacao.md) e o [relatório da revisão](validacao/relatorio-revisao.md).

## Identidade

Laranja, branco e preto, marca LUUGAR e pin G. Nas próximas peças, usar Baruta Black somente em palavras de destaque. As artes da primeira campanha foram preservadas.

Os arquivos temporários da revisão e o ZIP que duplica as artes não são versionados. O envio para este repositório não configura hospedagem automaticamente.
