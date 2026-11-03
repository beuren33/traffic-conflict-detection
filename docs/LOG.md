# Log de decisões pequenas

Append-only, uma linha por decisão: `data | fase | decisão | porquê`. Decisão grande vai em [ADR](decisions/INDEX.md).

| Data | Fase | Decisão | Porquê |
|---|---|---|---|
| 2026-11-02 | geral | Tudo em português | preferência do usuário |
| 2026-11-02 | geral | Sem prazo fixo; escopo tudo ou nada | preferência do usuário ([ADR 0003](decisions/0003-escopo-e-experimentos.md)) |
| 2026-11-02 | 1 | Usuário está na seção 5 do curso | informado na sessão |
| 2026-11-02 | 2 | imgsz, épocas e stride só depois de treino curto de teste | medir tempo real no Colab antes de fixar |
| 2026-11-02 | 3 | Exp 3 (do zero) usa o melhor modelo do Exp 1 | comparação direta fine-tuning vs zero |
| 2026-11-02 | 0 | Fase 0 criada (acesso/licença dos datasets) | nenhum dataset verificado ainda |
| 2026-11-02 | geral | Ordem das decisões de caminhão: esperar CADP/TAD | colisão não exige a classe |
| 2026-11-02 | geral | Notebooks `.ipynb` vivem no Drive, rodados pelo usuário | fluxo do usuário |
| 2026-11-02 | geral | Estrutura aprovada e criada: 21 notebooks vazios em `src/` (cabeçalho + `CONFIG`), `splits/` na raiz versionada, `sync_drive.sh` mantido | planejar antes ([conventions](conventions.md)) |
| 2026-11-03 | geral | Notebooks vazios apagados; criar conforme a fase chega; um notebook por modelo em `deteccao/` | preferência do usuário ([ADR 0008](decisions/0008-somente-notebooks.md)) |
| 2026-11-02 | geral | `.gitignore` ancorado (`/data/`, `/outputs/`, `/runs/`) | `runs/` solto ignoraria `docs/experiments/runs/` |
| 2026-11-02 | geral | `data/{raw,processed}`, `outputs/<etapa>/`, `runs/<etapa>/` | preferência do usuário |
