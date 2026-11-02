# 0001: Câmera fixa, Ultralytics YOLO, ByteTrack

Data: 2026-11-02. Status: aceito. Voltar: [índice](INDEX.md).

**Contexto:** projeto de visão computacional para prever colisão em vídeo; objetivo de aprendizado é dominar detecção de objetos em vídeo.

**Decisão:** câmera fixa de trânsito é o domínio principal (dashcam é extra). Detector da família YOLO via Ultralytics (PyTorch). Rastreio ByteTrack pelo modo `track`.

**Porquê:** câmera fixa tem fundo estável e datasets com tracks anotados; Ultralytics unifica várias versões YOLO com a mesma API, o que permite a comparação justa ([0003](0003-escopo-e-experimentos.md)).

**Alternativas:** dashcam como principal (movimento da câmera complica o TTC); detectores não-YOLO (cortados da v1).
