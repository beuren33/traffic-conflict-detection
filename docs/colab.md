# Fluxo Colab + Drive

Voltar: [INDEX](INDEX.md). Decisão: [ADR 0005](decisions/0005-ambiente-colab-drive.md).

## Fluxo

1. Local: editar código/docs. Máquina só tem CPU.
2. `scripts/sync_drive.sh push` envia o projeto para a pasta do Drive (incremental, via rclone). `pull` traz resultados (runs, tabelas) de volta.
3. No Colab: abrir o `.ipynb` da pasta do Drive, montar o Drive, rodar `src/` a partir da pasta sincronizada.
4. Resultados e checkpoints gravam no Drive; depois `pull` e registrar em [experiments](experiments/INDEX.md).

## rclone (configurar na Fase 0)

- `rclone config` criar remote tipo Google Drive, nome padrão `gdrive` (variáveis no topo do script).
- Teste com `scripts/sync_drive.sh push --dry-run` (o padrão é dry-run).

## Cuidados

- Sessão pode cair: salvar checkpoint por época no Drive e treinar com `resume`.
- GPU do Colab varia: registrar a GPU em cada run; FPS só no benchmark separado.
- Dataset grande: dividir uma vez, nunca regerar sem ADR.
- Notebook fino: sem lógica, só chama `src/`.
