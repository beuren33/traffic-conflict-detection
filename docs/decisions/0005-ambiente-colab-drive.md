# 0005: Colab Pro, Drive, rclone, FPS separado

Data: 2026-11-02. Status: aceito. Voltar: [índice](INDEX.md). Operação: [../colab.md](../colab.md).

**Decisão:**
- Máquina local só CPU; treino no Colab Pro/Pro+.
- Tudo que passa de 100 MB fica numa pasta do Drive. Repo guarda código e .md.
- `scripts/sync_drive.sh` (rclone) sincroniza a pasta local com o Drive de forma incremental, para não reenviar tudo.
- O usuário abre o `.ipynb` no Drive e executa por conta própria; lógica fica em `src/`, notebook fino.
- Treino pode rodar em qualquer GPU; FPS e memória vêm de benchmark separado, mesma GPU, uma sessão, GPU registrada.
- Checkpoint por época no Drive e `resume` (sessão pode cair).

**Porquê:** Colab sorteia GPU, então FPS de runs diferentes não é comparável.

**Alternativas:** Kaggle (não usado agora); exigir T4 em todo treino (pode faltar GPU).
