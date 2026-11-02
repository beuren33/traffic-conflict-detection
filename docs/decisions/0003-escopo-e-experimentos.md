# 0003: Escopo tudo ou nada e grade de experimentos

Data: 2026-11-02. Status: aceito. Voltar: [índice](INDEX.md).

**Decisão:** sem prazo fixo e sem linha de corte: todas as fases 0-8 e 10 são obrigatórias; a 9 escolhe um ou dois extras. Grade de modelos, sempre com ponto de partida COCO (exceto o do zero):

| # | Experimento |
|---|---|
| 0 | Baseline COCO sem treino: YOLOv8, v10, 11, 12, 26, tamanho `n` |
| 1 | Fine-tuning dos cinco `n` no UA-DETRAC |
| 2 | 2 ou 3 melhores em `s` |
| 3 | O melhor do Exp 1 treinado do zero (mesmas épocas; rodada longa se sobrar tempo) |

Fora da v1: RT-DETR, Faster R-CNN, grade Open Images/OIDv4 (movidos para [Fase 9](../phases/09-extras.md)).

**Porquê:** o usuário quer testar só fine-tuning (COCO) e um modelo do zero; a grade menor cabe no Colab.

**Igual entre modelos:** dataset, split, imgsz, épocas, semente. Valores fixados depois do treino curto de teste ([Fase 2](../phases/02-dataset.md)). Hardware de treino varia; FPS/memória usam benchmark separado ([0005](0005-ambiente-colab-drive.md)).
