# Detecção de veículos e previsão de colisão em vídeo

Plano atual do projeto: decisões tomadas, pipeline e etapas de execução.

## Objetivo

Construir um pipeline que detecta veículos em vídeo de câmera fixa, rastreia cada um e emite um alerta de risco de colisão com alguns segundos de antecedência. O alerta vem primeiro de uma regra (TTC, tempo até a colisão) e depois de um LSTM, comparados nos mesmos vídeos.

O objetivo de aprendizado é dominar detecção de objetos em vídeo. O portfólio prova isso com números: mAP do detector, antecedência do alerta e alarmes falsos.

## Decisões tomadas

**Domínio e ferramentas**
- Câmera fixa de trânsito é o domínio principal. Dashcam fica como extra.
- Detector: família YOLO no Ultralytics (PyTorch). O curso (Jones Granatyr, Udemy) dá a base; a seção 6 (YOLOv8) é a ponte para o pipeline.
- Rastreio: ByteTrack, pelo modo `track` do Ultralytics.

**Detector**
- O YOLO só detecta veículos (carro, caminhão, ônibus, moto). Ele não prevê colisão.
- Treina com **imagens**: quadros extraídos dos vídeos (um a cada 5 ou 10), com as caixas convertidas para o formato YOLO.
- Divisão treino/validação **por sequência (vídeo)**, nunca por quadro.
- Dataset de treino: **UA-DETRAC** (câmera fixa, 100 vídeos, mais de 140 mil quadros, caixas e tracks anotados).
- Classes: separadas (carro, caminhão, ônibus, moto) ou uma só ("veículo"). Decidir na Fase 2.

**Modelos a comparar** (mesmo dataset, mesma divisão, mesmo `imgsz`, mesmas épocas, mesma semente, mesmo hardware)

| # | Experimento | Ponto de partida | Obrigatório |
|---|---|---|---|
| 0 | YOLOv8, v10, 11, 12 e 26 sem treinar (baseline) | COCO | Sim |
| 1 | Os mesmos cinco, tamanho `n` | COCO (fine-tuning) no UA-DETRAC | Sim |
| 2 | Os 2 ou 3 melhores, tamanho `s` | COCO (fine-tuning) no UA-DETRAC | Sim |
| 3 | **Um** modelo do zero | Pesos aleatórios, no UA-DETRAC | Sim, um só |
| 4 | RT-DETR e Faster R-CNN (contraste) | Pré-treinados | Opcional |
| 5 | Grade 2x2: do zero ou pré-treinado × treinado no UA-DETRAC ou no Open Images (via OIDv4_ToolKit), sempre testado no teste do UA-DETRAC | Varia | Opcional |

- Modelo do zero: primeiro com as mesmas épocas dos outros; se sobrar tempo, segunda rodada mais longa, registrando as duas.
- Métricas: mAP@0.5, mAP@0.5:0.95, recall em veículos, FPS e memória. Para o rastreio, recall e FPS pesam mais que o mAP, porque um carro não detectado quebra o ID.
- Confirmar na documentação da versão do Ultralytics o nome exato dos pesos de v10, 12 e 26.

**Previsão de colisão**
1. **Regra de TTC (baseline):** velocidade por ID (reta nos últimos k quadros), projeção com velocidade constante, TTC = primeiro instante em que as caixas se sobrepõem dentro de um horizonte (começar com 3 s). Alerta só se o TTC ficar abaixo do limite por vários quadros seguidos.
2. **LSTM sobre trajetórias:** janelas dos últimos N segundos, rótulo "acidente nos próximos T segundos", treinado nas mesmas tabelas de trajetória.
3. TTC e LSTM são comparados no mesmo teste final.

**Datasets por etapa**

| Etapa | Dataset | Papel |
|---|---|---|
| Treinar o YOLO | UA-DETRAC | Detector de veículos em câmera fixa |
| Checar o detector em cenas de acidente | CADP (205 segmentos com caixas) | Ver falhas por oclusão, batida, distância, noite |
| Avaliar o rastreio | UA-DETRAC | Tracks anotados para medir trocas de ID |
| Vídeos com acidente | CADP + TAD | Ajuste do TTC, treino e teste do LSTM |
| Vídeos normais (alarmes falsos) | UA-DETRAC (parte de teste) + vídeos sem acidente do TAD | Medir alertas falsos |

Dados de referência: CADP tem 230 vídeos de câmeras fixas e 1.416 segmentos de acidente; TAD tem 333 vídeos de vigilância, 261 com acidente, com foco em rodovias.

## Pipeline

```
Curso -> Dataset (UA-DETRAC) -> Treinar e comparar YOLOs -> Escolher o melhor
      -> ByteTrack (IDs) -> Tabela de trajetórias (frame, ID, caixa)
      -> Regra TTC (baseline) -> Treinar LSTM -> Avaliar TTC vs LSTM -> Portfólio
```

Como o vídeo vira previsão: o YOLO acha os carros em cada quadro, o ByteTrack dá um ID a cada um, e disso sai uma tabela de posições por ID e por quadro. TTC e LSTM trabalham só com essa tabela, sem a imagem.

## Etapas de execução

### Fase 1: Curso
- [ ] Seção 3 (YOLO e OpenCV em imagens): terminar. Extrair saída do modelo, caixas e NMS.
- [ ] Seção 4 (vídeo com Darknet): passar por cima. Extrair leitura de vídeo quadro a quadro.
- [ ] Seção 5 (objetos personalizados): seletivo. Dataset, anotação, divisão e métricas; pular a configuração do Darknet.
- [ ] Seção 6 (YOLOv8): inteira, junto com a Fase 2. Verificar se há aula de rastreio.

Pronto quando: você explica IoU, mAP e NMS e rodou treino e validação de um YOLOv8 em um dataset pequeno.

### Fase 2: Dataset do detector
- [ ] Baixar o UA-DETRAC (conferir origem e licença).
- [ ] Extrair um quadro a cada 5 ou 10 e converter as anotações para o formato YOLO.
- [ ] Dividir por sequência em treino e validação; separar a parte de teste, que fica fora de qualquer treino.
- [ ] Definir as classes (separadas ou uma só).
- [ ] Escrever o `data.yaml` e conferir imagens com as caixas desenhadas.

Pronto quando: um treino curto do YOLOv8n roda sem erro e as caixas batem com os carros.

### Fase 3: Treinar e comparar os modelos
- [ ] Rodar a grade de experimentos da tabela acima.
- [ ] Registrar mAP, recall, FPS e memória de cada um.
- [ ] Escolher um modelo, com justificativa em uma frase.

### Fase 4: Checar o detector nas cenas do CADP
- [ ] Rodar o modelo escolhido nos segmentos do CADP com caixas anotadas e comparar.
- [ ] Anotar onde falha (oclusão, batida, distância, noite).
- [ ] Se falhar muito, misturar mais dados (Open Images ou quadros do CADP) e retreinar, mantendo os vídeos de teste fora.

### Fase 5: ByteTrack e tabela de trajetórias
- [ ] Rodar o modelo escolhido com `track` nos vídeos de acidente e nos normais.
- [ ] Salvar uma tabela por vídeo: quadro, ID, classe e caixa.
- [ ] Avaliar o rastreio no UA-DETRAC (trocas de ID e tracks fragmentados).
- [ ] Ajustar limiares de confiança do detector e do rastreador se os IDs quebrarem.

### Fase 6: Regra de TTC
- [ ] Calcular a velocidade de cada ID e projetar os pares.
- [ ] Disparar alerta só após vários quadros seguidos abaixo do limite.
- [ ] Ajustar limite, horizonte, k e encolhimento das caixas no conjunto de ajuste, nunca no teste.
- [ ] Validar em casos simples em que a resposta é conhecida.
- [ ] Opcional: calibrar a câmera (homografia) para medir em metros.

### Fase 7: Avaliar o TTC nos vídeos de acidente
- [ ] Conferir como o instante do evento está rotulado em CADP e TAD.
- [ ] Medir no conjunto de ajuste: % de acidentes alertados antes do evento, antecedência média, alarmes falsos por vídeo normal e AP.
- [ ] Documentar os casos de falha.

### Fase 8: LSTM
- [ ] Montar janelas dos últimos N segundos (posições, velocidades, distância relativa).
- [ ] Rotular: acidente nos próximos T segundos, sim ou não. Vídeos normais são negativos.
- [ ] Dividir por vídeo em treino, validação e teste, juntando CADP e TAD.
- [ ] Treinar um LSTM pequeno e comparar com o TTC na validação.
- [ ] Abrir o teste final uma única vez e comparar TTC e LSTM nas mesmas métricas.
- [ ] Opcional: trajetória mais características de imagem, para ver quanto a aparência ajuda.

### Fase 9: Extras (escolher um ou dois)
- [ ] Segmentação de instância (`-seg`): TTC com máscara contra TTC com caixa.
- [ ] Homografia por câmera para medir em metros.
- [ ] Dashcam (Nexar, DoTA) para testar outro domínio.
- [ ] Exportar para ONNX e medir FPS; registrar experimentos no MLflow.
- [ ] Outros detectores: SSD, DETR, RF-DETR.

### Fase 10: Portfólio
- [ ] README com o diagrama do pipeline, datasets e licenças.
- [ ] Tabela de modelos (Fase 3) e tabela TTC contra LSTM (Fase 8).
- [ ] Vídeo curto de demonstração com caixas, IDs e alerta.
- [ ] Casos de falha e limitações.
- [ ] Código em módulos, com semente e versões fixadas.

## Regras do jogo

- Dividir sempre por vídeo (e por câmera, se possível), nunca por quadro.
- Três conjuntos para colisão: ajuste dos limites, treino do LSTM e teste final. O teste só é aberto no fim, e nada é ajustado depois.
- Entre modelos comparados, manter igual: dataset, divisão, tamanho de imagem, épocas, semente e hardware.
- Registrar cada experimento (modelo, dados, parâmetros, métricas), com MLflow ou planilha.
- Incluir vídeos normais no teste para medir alarmes falsos.
- Conferir a licença de cada dataset antes de publicar.

## Decisões em aberto

| Item | Quando decidir |
|---|---|
| Classes separadas ou uma só | Fase 2 |
| Modelo do zero com mais épocas | Fase 3 |
| Misturar Open Images ou quadros do CADP no treino | Fase 4, só se o detector falhar |
| Como o instante do evento está rotulado no TAD | Fase 7 |
| Poucos vídeos de acidente para o LSTM | Fase 8: juntar CADP e TAD, validar por vídeo, tratar como estudo exploratório |
| Disponibilidade e licença (UA-DETRAC, CADP, TAD, DoTA, Nexar) | Fase 2, antes de baixar |

## Limitações conhecidas

- Tudo em pixels: a perspectiva faz carros distantes parecerem lentos. Medir em metros exige calibrar a câmera por câmera.
- Velocidade constante: não captura frenagem.
- Pares que já se sobrepõem na imagem são ignorados no TTC (oclusão e perspectiva).
- O escore de risco vai de 0 a 1, mas não é uma probabilidade calibrada.
- Poucos vídeos de acidente em câmera fixa: o LSTM tende a ser limitado em dados.
- O UA-DETRAC tem poucas câmeras: o detector pode generalizar mal para outras.