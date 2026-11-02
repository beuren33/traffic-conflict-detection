# 0004: Divisão de dados por vídeo

Data: 2026-11-02. Status: aceito. Voltar: [índice](INDEX.md).

**Detector (UA-DETRAC):** split oficial, 60 vídeos de treino e 40 de teste. Validação sai dos 60 por vídeo. Teste lacrado. Nunca dividir por quadro.

**Colisão (CADP + TAD):** 80% treino (dentro dele, 10% validação, ≈8% do total) e 20% teste, por vídeo, semente fixa, listas versionadas em `splits/`. TTC ajusta e LSTM treina nos 80%; o teste de 20% abre uma vez, na [Fase 8](../phases/08-lstm.md).

**Porquê:** quadros do mesmo vídeo são quase idênticos (vazamento). Validação de ≈8% tem poucos acidentes: ruído alto, por isso validação cruzada por vídeo dentro dos 80% quando necessário.

**Se misturar quadros do CADP no treino do detector (Fase 4):** vídeos do teste de colisão ficam fora.
