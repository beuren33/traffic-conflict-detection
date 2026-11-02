# Fase 2: Dataset do detector

Voltar: [PLAN](../PLAN.md). Antes: [00-acesso](00-acesso.md). Dados: [datasets/uadetrac.md](../datasets/uadetrac.md).

- [ ] Extrair quadros do UA-DETRAC (stride a definir; sugestão 10).
- [ ] Converter caixas para formato YOLO, classe única "veiculo" ([ADR 0002](../decisions/0002-classe-unica-veiculo.md)).
- [ ] Split: oficial 60 treino / 40 teste; val sai do treino por vídeo ([ADR 0004](../decisions/0004-splits.md)). Salvar listas em `splits/`.
- [ ] Escrever `data.yaml` e desenhar caixas em amostra para conferir.
- [ ] Treino curto de teste (YOLOv8n) para medir tempo por época e fixar imgsz, épocas, stride. Gravar em ADR.

Pronto quando: treino curto roda sem erro, caixas batem com os carros, hiperparâmetros fixados em ADR.
