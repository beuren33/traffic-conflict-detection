# 0008: Código 100% em notebooks, organizado por etapa

Data: 2026-11-02. Status: aceito. Substitui a parte "scripts `.py` + notebook fino" do [ADR 0005](0005-ambiente-colab-drive.md). Voltar: [índice](INDEX.md).

**Decisão:**
- Todo o código vive em `.ipynb` dentro de `src/`, sem nenhum `.py`. Um notebook por tarefa.
- Notebooks são criados **conforme a fase chega**, nunca antes (os vazios iniciais foram apagados em 2026-11-03).
- Em `deteccao/`, **um notebook por modelo** (treino e avaliação daquele modelo juntos), não notebooks genéricos de treinar/avaliar.
- `src/` organizada por etapa (nome, sem número): `comum`, `eda`, `processamento`, `deteccao`, `rastreio`, `colisao`, `extras`. A fase fica no cabeçalho de cada notebook, linkando [PLAN](../PLAN.md).
- Código compartilhado (caminhos, semente, métricas, leitura de vídeo) fica em `src/comum/comum.ipynb`, carregado pelos outros com `%run`.
- Configuração (hiperparâmetros, caminhos) numa célula `CONFIG` no topo de cada notebook. Sem pasta `configs/` e sem yaml.
- Dados em `data/raw` e `data/processed`; resultados em `outputs/<etapa>/`; treinos em `runs/<etapa>/`. Tudo fora do git, espelho do Drive ([colab](../colab.md)).

**Regras de manuseio (harness):**
- Limpar as saídas das células antes de salvar, exceto notebooks de análise de resultados (EDA e avaliação), onde as saídas fazem parte do resultado.
- Nunca ler o `.ipynb` inteiro: ler só as células de código necessárias. O arquivo continua `.ipynb` real; não se converte para texto.
- Figuras e tabelas importantes são salvas em `outputs/<etapa>/` e resumidas no [RELATORIO](../RELATORIO.md).

**Porquê:** é o fluxo do usuário (abre e roda no Colab).

**Custos aceitos:** diffs em JSON, `%run` mais frágil que `import`, código difícil de testar. Mitigação: notebooks pequenos, uma tarefa cada, `comum.ipynb` mínimo.
