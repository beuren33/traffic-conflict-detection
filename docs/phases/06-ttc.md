# Fase 6: Regra de TTC

Voltar: [PLAN](../PLAN.md). Antes: [05-tracking](05-tracking.md).

Regra: velocidade por id (reta nos últimos k quadros), projeção com velocidade constante, TTC = primeiro instante em que as caixas se sobrepõem dentro do horizonte (começar com 3 s). Alerta só se o TTC ficar abaixo do limite por vários quadros seguidos.

- [ ] Calcular velocidade por id e projetar os pares.
- [ ] Alerta só após vários quadros seguidos abaixo do limite.
- [ ] Ajustar limite, horizonte, k e encolhimento das caixas **no conjunto de treino/val (80%), nunca no teste** ([ADR 0004](../decisions/0004-splits.md)).
- [ ] Validar em casos sintéticos com resposta conhecida.
- [ ] Opcional: homografia para medir em metros.
