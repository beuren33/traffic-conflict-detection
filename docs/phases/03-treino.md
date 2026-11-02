# Fase 3: Treinar e comparar os modelos

Voltar: [PLAN](../PLAN.md). Antes: [02-dataset](02-dataset.md). Registro: [experiments/INDEX.md](../experiments/INDEX.md).

Igual em todos: dataset, split, imgsz, épocas, semente, valores de [conventions](../conventions.md).

- [ ] Exp 0: baseline COCO sem treino (v8, v10, 11, 12, 26 `n`). Funde car/bus/truck/motorcycle em "veiculo".
- [ ] Exp 1: fine-tuning dos cinco `n`.
- [ ] Exp 2: 2 ou 3 melhores em `s`.
- [ ] Exp 3: melhor do Exp 1 do zero. Segunda rodada mais longa se sobrar tempo; registrar as duas.
- [ ] Benchmark de FPS e memória em script separado, mesma GPU, numa sessão só ([ADR 0005](../decisions/0005-ambiente-colab-drive.md)).
- [ ] Métricas: mAP@0.5, mAP@0.5:0.95, recall, FPS, memória. Para rastreio, recall e FPS pesam mais.
- [ ] Escolher um modelo, justificativa em uma frase (ADR).

Cada run: linha em `results.csv` + `.md` em `experiments/runs/`.
