# Fase 0: Acesso, licença e inspeção dos datasets

Voltar: [PLAN](../PLAN.md). Próxima: [01-curso](01-curso.md).

Por quê: se um dataset estiver indisponível, o plano muda ([risks](../risks.md)).

- [ ] UA-DETRAC: achar link vivo, baixar, registrar licença. Atualizar [datasets/uadetrac.md](../datasets/uadetrac.md).
- [ ] CADP: idem. [datasets/cadp.md](../datasets/cadp.md).
- [ ] TAD: idem. [datasets/tad.md](../datasets/tad.md).
- [ ] Contar vídeos de acidente e normais utilizáveis (CADP + TAD).
- [ ] Descobrir como o instante do evento é rotulado em CADP e TAD.
- [ ] Ver se CADP/TAD anotam caminhão/moto (decide a questão de classes).
- [ ] Confirmar nomes dos pesos Ultralytics: v8, v10, 11, 12, 26.
- [ ] Configurar `rclone` e testar [scripts/sync_drive.sh](../../scripts/sync_drive.sh) ([colab](../colab.md)).

Pronto quando: os três datasets estão no Drive (ou alternativa registrada em ADR) e as pendências acima têm resposta no [LOG](../LOG.md).
