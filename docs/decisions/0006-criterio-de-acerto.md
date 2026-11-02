# 0006: Alerta válido = antecedência ≥ 1,0 s

Data: 2026-11-02. Status: aceito. Voltar: [índice](INDEX.md).

**Decisão:** no teste final, alerta conta como acerto se disparar entre 1,0 s e o horizonte (3 s) antes do evento. Menos de 1,0 s é "tardio". Reportar também a curva por limiar. Métricas: % de acidentes alertados, antecedência média, alarmes falsos por vídeo normal, AP.

**Porquê:** menos de 1 s não dá tempo de reagir.

**Risco:** vídeos curtos podem não ter 1 s antes do evento; checar na [Fase 0](../phases/00-acesso.md).
