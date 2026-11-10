# Revisão local da LUUGAR B.1 — 10/11/2026

## Entrega

- Fluxos separados para desabafar e cadastrar, com calculadora pública independente.
- Progresso da calculadora recuperado após recarregar a página e preservado ao seguir para cadastro.
- Corrigido o limite do controle ao restaurar 24 meses: antes podia reduzir pagamentos informados a 12; agora preserva o período.
- Resultado mostra respostas que entraram na conta, fórmula e cobertura das categorias. Explica por que uma nota alta com poucos dados não é um histórico completo.
- Validação de telefone, mensagens de campo obrigatório e botão para limpar respostas.
- Ajustes de contraste, tamanho de campos e alvos de toque, navegação por foco, redução de movimento e layout de celular.
- Baruta reservada a palavras de destaque, ajustes de texto na B.1 e retirada de endereço de contato não confirmado.
- Kit de testes com participantes, perguntas para imobiliárias, critérios da simulação e tabela de observações.

## Verificação realizada

17 grupos de testes automatizados locais passaram no Microsoft Edge, sem erros JavaScript ou recursos HTTP ausentes no fluxo testado:

1. Modelo: extremos, 24 períodos, média parcial e entradas inválidas.
2. Landing: sem excesso horizontal em 320, 390, 768 e 1440 pixels.
3. Desabafo vazio bloqueado; Escape fecha e devolve foco ao botão.
4. Cadastro exigido no caminho próprio, telefone inválido rejeitado e prefixo +55 aceito; novidades opcionais.
5. Sem histórico termina sem nota.
6. 24 meses, uso natural sem penalidade e restauração da avaliação por cômodos.
7. Simulação pública mantida ao cadastrar.
8. Cobertura parcial de 45% e totais aplicáveis visíveis.
9. Vistoria inconsistente bloqueada; nota zero válida.
10. Cenário misto resulta em 500.
11. Reduzir período ajusta controle e exige nova confirmação.
12. Avaliação exige ambiente; cômodo removido não entra na conta.
13. Calculadora e perguntas ajustadas ao celular.
14. Limite de três anexos, gravação local e exclusão com confirmação.
15. Preferência de movimento reduzido respeitada.
16. Armazenamento da sessão indisponível mantém a simulação com aviso.
17. Ausência de erros e recursos faltantes no fluxo principal.

Verificações adicionais confirmaram revelação das seções durante a rolagem, ciclo de foco por teclado dentro da janela, cancelamento e confirmação da limpeza, recuperação diante de rascunho inválido, aviso com JavaScript desligado e layout móvel do kit. O ciclo de foco da janela foi ajustado após essa checagem.

Capturas da landing, do resultado e da calculadora no celular foram inspecionadas visualmente. Essa verificação não substitui testes com pessoas, avaliação completa de acessibilidade ou testes em Safari/iOS e Firefox.

## Limites para o lançamento

O cadastro é local, não uma conta autenticada. Respostas da simulação ficam na sessão; relatos e arquivos ficam no armazenamento local do navegador. Nada disso chega a um servidor da LUUGAR. Fechar uma sessão pode apagar o cadastro e a simulação; relatos locais têm exclusão própria.

O score é autodeclarado e experimental, sem validação preditiva, sem aprovação garantida e sem promessa de dispensa de fiador ou caução. A coleta persistente, privacidade, segurança dos anexos, canais oficiais e publicação precisam estar resolvidos antes de uma campanha aberta.

As versões B e C foram preservadas. Nenhuma publicação, anúncio ou conexão com conta externa foi realizada nesta revisão.
