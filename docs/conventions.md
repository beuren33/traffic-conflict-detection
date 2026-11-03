# Convenções

Voltar: [INDEX](INDEX.md). Decisão da estrutura: [ADR 0008](decisions/0008-somente-notebooks.md).

## Estrutura do repo (pastas criadas; notebooks nascem quando a fase chega)

```
src/                       só .ipynb; pastas por etapa, sem notebooks por enquanto
  comum/                   futuro comum.ipynb: caminhos, semente, métricas, vídeo (via %run)
  eda/                     um por dataset
  processamento/           um por tarefa
  deteccao/                um notebook POR MODELO (ex.: yolov8n.ipynb, yolo11n.ipynb)
  rastreio/  colisao/  extras/
splits/                    listas de vídeos por split (versionadas, pequenas)
scripts/                   sync_drive.sh
data/{raw,processed}/      fora do git; espelho do Drive
outputs/<etapa>/           figuras, tabelas, trajetórias; fora do git
runs/<etapa>/              treinos e pesos; fora do git
docs/                      harness
```

## Notebooks

- Cabeçalho: propósito, fase (link para o [PLAN](PLAN.md)), entradas, saídas.
- Célula `CONFIG` no topo com hiperparâmetros e caminhos; nada de valor mágico espalhado.
- Saídas limpas antes de salvar, exceto EDA e avaliação.
- Nunca ler o `.ipynb` inteiro; só as células de código necessárias.

## Regras

- Semente padrão 42 (confirmar em ADR após treino curto de teste). Versões de libs fixadas.
- Split por vídeo ([ADR 0004](decisions/0004-splits.md)). Listas em `splits/`, nunca regeradas sem ADR.
- Teste lacrado: detector (UA-DETRAC 40 vídeos) e colisão (20%). Abrir teste de colisão uma vez, na [Fase 8](phases/08-lstm.md).
- Nome de run: `NNN-modelo-tamanho-init` (ex.: `012-yolo11n-ft`). Entra em [experiments](experiments/INDEX.md).
- Tabela de trajetórias (Fase 5): CSV com `video, frame, id, classe, x1, y1, x2, y2, conf`.
- Métricas do detector: mAP@0.5, mAP@0.5:0.95, recall, FPS, memória. Colisão: [ADR 0006](decisions/0006-criterio-de-acerto.md).
- Arquivos > 100 MB não vão ao git; ficam no Drive ([colab](colab.md)).
