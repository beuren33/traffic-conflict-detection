# Notas para o relatório final

Documento acumulativo. Toda sessão anexa aqui o que importa para o relatório: resultados, números, falhas, descobertas, conceitos aprendidos, imagens/gráficos gerados (com caminho). Não apagar; corrigir com nota datada. Escrever como rascunho utilizável, com links para [decisões](decisions/INDEX.md), [experimentos](experiments/INDEX.md) e [datasets](datasets/).

Formato de entrada: `### AAAA-MM-DD | Fase N | título` e texto curto.

## Motivação e objetivo

Detecção de veículos em câmera fixa e alerta de colisão antecipado (TTC vs LSTM). Objetivo de aprendizado: dominar detecção de objetos em vídeo. Origem: [../context.md](../context.md).

## Datasets

(preencher na [Fase 0](phases/00-acesso.md): origem, licença, tamanho, problemas)

## Detector

(Fases [2](phases/02-dataset.md), [3](phases/03-treino.md), [4](phases/04-cadp.md))

## Rastreio

([Fase 5](phases/05-tracking.md))

## Colisão: TTC e LSTM

(Fases [6](phases/06-ttc.md), [7](phases/07-avaliar-ttc.md), [8](phases/08-lstm.md))

## Falhas e limitações

(ver também [risks](risks.md))

## Registro cronológico

### 2026-11-02 | Planejamento | Plano fechado
Sessão de planejamento: resolvidas classes (uma só, pois UA-DETRAC não tem caminhão/moto), grade de experimentos enxuta (fine-tuning COCO e um modelo do zero), split por vídeo, ambiente Colab Pro com Drive e rclone, critério de acerto ≥ 1 s. Detalhes nos [ADRs](decisions/INDEX.md).
