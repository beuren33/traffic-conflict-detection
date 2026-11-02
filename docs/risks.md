# Riscos e limitações

Voltar: [INDEX](INDEX.md).

## Riscos abertos

| Risco | Mitigação |
|---|---|
| Dataset indisponível ou licença restritiva (UA-DETRAC tem links instáveis) | [Fase 0](phases/00-acesso.md) antes de tudo; alternativa vira ADR |
| Instante do evento mal rotulado em CADP/TAD | checar na Fase 0 |
| Poucos vídeos de acidente em câmera fixa | validação cruzada por vídeo; LSTM exploratório |
| Validação de colisão minúscula (≈8%) | CV por vídeo ([ADR 0004](decisions/0004-splits.md)) |
| Vídeos curtos sem 1 s antes do evento | checar contagem na Fase 0 ([ADR 0006](decisions/0006-criterio-de-acerto.md)) |
| Sessão do Colab cai no meio do treino | checkpoint + resume ([colab](colab.md)) |
| GPU do Colab varia | benchmark de FPS separado |

## Limitações conhecidas

- Tudo em pixels: perspectiva faz carro distante parecer lento; metros exigem calibrar por câmera.
- Velocidade constante: não captura frenagem.
- Pares que já se sobrepõem na imagem são ignorados no TTC.
- Escore de risco 0-1 não é probabilidade calibrada.
- UA-DETRAC tem poucas câmeras: detector pode generalizar mal.
