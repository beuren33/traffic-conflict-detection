# Protocolo de sessão

Voltar: [INDEX](INDEX.md).

## Início

1. Ler [INDEX](INDEX.md) e [STATE](STATE.md). Nada mais.
2. Abrir só o arquivo da fase atual ([PLAN](PLAN.md)) e os links que ele pedir.
3. Confirmar com o usuário o objetivo da sessão em uma frase.

## Durante

- Decisão pequena: linha em [LOG](LOG.md) na hora.
- Decisão grande (muda arquitetura, dados, métrica, escopo; difícil de reverter; tem alternativas reais): novo ADR e linha em [decisions/INDEX](decisions/INDEX.md).
- Resultado, número, falha, imagem, conceito aprendido: anexar em [RELATORIO](RELATORIO.md).
- Run de treino/avaliação: linha em [results.csv](experiments/results.csv) e `.md` em `experiments/runs/`, linkado do [índice](experiments/INDEX.md).
- Fato de dataset (licença, formato, acesso): atualizar o arquivo em [datasets/](datasets/).
- Ambiguidade na mensagem do usuário: perguntar antes de agir.

## Fim

1. Reescrever [STATE](STATE.md): fase, feito, próximo passo, bloqueios.
2. Marcar checkboxes na fase.
3. Avisar que mudanças estão no working tree. **Não commitar** sem pedido explícito.

## Modelo de ADR

```
# NNNN: título
Data. Status: aceito/substituído por NNNN. Voltar: índice.
**Contexto:** ...
**Decisão:** ...
**Porquê:** ...
**Alternativas:** ...
```

ADR substituído não se apaga: muda o status e linka o novo.
