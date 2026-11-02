# Plano

Sem prazo fixo, escopo "tudo ou nada" ([ADR 0003](decisions/0003-escopo-e-experimentos.md)). Execução no Colab Pro ([ADR 0005](decisions/0005-ambiente-colab-drive.md)).

## Pipeline

```
Curso -> Acesso aos dados -> UA-DETRAC (1 classe) -> Comparar YOLOs -> Escolher
      -> ByteTrack -> Tabela de trajetórias (frame, id, classe, caixa)
      -> Regra TTC -> LSTM -> TTC vs LSTM no teste -> Portfólio
```

## Fases

| # | Fase | Arquivo |
|---|---|---|
| 0 | Acesso, licença e inspeção dos datasets | [00-acesso](phases/00-acesso.md) |
| 1 | Curso (Jones Granatyr) | [01-curso](phases/01-curso.md) |
| 2 | Dataset do detector (UA-DETRAC) | [02-dataset](phases/02-dataset.md) |
| 3 | Treinar e comparar os modelos | [03-treino](phases/03-treino.md) |
| 4 | Checar o detector no CADP | [04-cadp](phases/04-cadp.md) |
| 5 | ByteTrack e tabela de trajetórias | [05-tracking](phases/05-tracking.md) |
| 6 | Regra de TTC | [06-ttc](phases/06-ttc.md) |
| 7 | Avaliar o TTC nos vídeos de acidente | [07-avaliar-ttc](phases/07-avaliar-ttc.md) |
| 8 | LSTM e comparação final | [08-lstm](phases/08-lstm.md) |
| 9 | Extras (1 ou 2) | [09-extras](phases/09-extras.md) |
| 10 | Portfólio | [10-portfolio](phases/10-portfolio.md) |

## Datasets

Detalhes e status de acesso em [datasets/](datasets/).

| Dataset | Papel | Arquivo |
|---|---|---|
| UA-DETRAC | Treino/val/teste do detector; teste de rastreio; vídeos normais | [uadetrac](datasets/uadetrac.md) |
| CADP | Falhas do detector; vídeos de acidente | [cadp](datasets/cadp.md) |
| TAD | Vídeos de acidente e normais | [tad](datasets/tad.md) |

## Modelos

Detalhe em [experiments/INDEX.md](experiments/INDEX.md) e [ADR 0003](decisions/0003-escopo-e-experimentos.md).

- Exp 0: baseline COCO sem treino (YOLOv8, v10, 11, 12, 26, tamanho `n`).
- Exp 1: fine-tuning dos cinco `n` no UA-DETRAC.
- Exp 2: 2 ou 3 melhores em `s`.
- Exp 3: o melhor do Exp 1 treinado do zero.
- Fora da v1: RT-DETR, Faster R-CNN, Open Images.

## Decisões em aberto

| Item | Quando |
|---|---|
| imgsz, épocas, stride de quadros | Fase 2, após treino curto de teste |
| Caminhão/moto como classe (depende de CADP/TAD anotarem) | Fase 0 |
| Rótulo do instante do evento em CADP e TAD | Fase 0 |
| Nomes dos pesos v10, 12, 26 no Ultralytics | Fase 0 |
| Modelo do zero com mais épocas | Fase 3 |
| Misturar quadros do CADP no treino | Fase 4, só se o detector falhar |
| Poucos vídeos de acidente para o LSTM | Fase 8 |
