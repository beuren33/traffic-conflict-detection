# 0002: Classe única "veiculo" na v1

Data: 2026-11-02. Status: aceito (caminhão pendente de checagem na Fase 0). Voltar: [índice](INDEX.md).

**Contexto:** UA-DETRAC só anota `car, bus, van, others`, sem caminhão nem moto. O `context.md` original supunha quatro classes.

**Decisão:** uma classe, "veiculo". Na avaliação do baseline COCO, car/bus/truck/motorcycle são fundidos nela. Caminhão/moto como classe só se CADP/TAD anotarem (Fase 0) e a colisão precisar; senão vira extra da [Fase 9](../phases/09-extras.md).

**Porquê:** colisão depende de posição e movimento, não do tipo. Menos ruído de rótulo. CADP/TAD não seguem as mesmas classes.

**Alternativas:** car/bus/van; treino sequencial DETRAC e depois caminhão (risco de catastrophic forgetting, descartado como principal); detector separado em paralelo (dobra custo); treino misto com COCO (guardado para a Fase 9).
