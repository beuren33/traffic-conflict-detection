# Convenções

Voltar: [INDEX](INDEX.md).

## Estrutura do repo

```
src/data/       download, conversão UA-DETRAC para YOLO, splits, loaders CADP/TAD
src/detect/     train.py, eval.py, benchmark_fps.py
src/track/      run_track.py
src/collision/  windows.py, ttc.py, lstm.py, eval.py
configs/        um yaml por experimento
notebooks/      .ipynb finos (montam Drive, chamam src/)
splits/         listas de vídeos por split (versionadas)
scripts/        sync_drive.sh
data/ runs/     fora do git; espelho do Drive
docs/           harness
```

## Regras

- Semente padrão 42 (confirmar em ADR após treino curto de teste). Versões de libs fixadas em `requirements.txt`.
- Split por vídeo ([ADR 0004](decisions/0004-splits.md)). Listas em `splits/`, nunca regeradas sem ADR.
- Teste lacrado: detector (UA-DETRAC 40 vídeos) e colisão (20%). Abrir teste de colisão uma vez, na [Fase 8](phases/08-lstm.md).
- Nome de run: `NNN-modelo-tamanho-init` (ex.: `012-yolo11n-ft`). Entra em [experiments](experiments/INDEX.md).
- Tabela de trajetórias (Fase 5): CSV com `video, frame, id, classe, x1, y1, x2, y2, conf`.
- Métricas do detector: mAP@0.5, mAP@0.5:0.95, recall, FPS, memória. Colisão: ver [ADR 0006](decisions/0006-criterio-de-acerto.md).
- Arquivos > 100 MB não vão ao git; ficam no Drive ([colab](colab.md)).
