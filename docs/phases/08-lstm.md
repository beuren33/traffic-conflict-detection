# Fase 8: LSTM e comparação final

Voltar: [PLAN](../PLAN.md). Antes: [07-avaliar-ttc](07-avaliar-ttc.md).

- [ ] Janelas dos últimos N segundos (posições, velocidades, distância relativa).
- [ ] Rótulo: acidente nos próximos T segundos, sim ou não. Normais são negativos.
- [ ] Divisão por vídeo: 80% treino (10% disso é validação), 20% teste ([ADR 0004](../decisions/0004-splits.md)). Poucos vídeos: validação cruzada por vídeo dentro dos 80%.
- [ ] Treinar LSTM pequeno e comparar com o TTC na validação.
- [ ] **Abrir o teste uma única vez** e comparar TTC e LSTM nas mesmas métricas ([ADR 0006](../decisions/0006-criterio-de-acerto.md)).
- [ ] Opcional: trajetória mais características de imagem.

Tratar como estudo exploratório (poucos dados, ver [risks](../risks.md)).
