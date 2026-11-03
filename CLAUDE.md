# Projeto: detecção de veículos e previsão de colisão em vídeo

Leia SÓ [docs/INDEX.md](docs/INDEX.md) e [docs/STATE.md](docs/STATE.md) no início da sessão. Não varra o repo. Abra outros arquivos pelos links, sob demanda.

## Regras duras

- Idioma: tudo em português (docs, README, comentários, respostas).
- **Sem `git commit`, `git push` nem nada no GitHub** sem pedido explícito do usuário na mensagem atual.
- Decisão tomada na sessão: gravar na hora. Pequena vai em [docs/LOG.md](docs/LOG.md); grande vira ADR em [docs/decisions/](docs/decisions/INDEX.md). Regra completa em [docs/protocolo-sessao.md](docs/protocolo-sessao.md).
- Fato relevante para o relatório final (resultado, falha, descoberta, número): anexar em [docs/RELATORIO.md](docs/RELATORIO.md) na hora.
- Fim da sessão: reescrever [docs/STATE.md](docs/STATE.md) (fase, próximo passo, bloqueios).
- Split sempre por vídeo, nunca por quadro. Teste lacrado: não abrir antes da hora ([docs/conventions.md](docs/conventions.md)).
- Execução pesada roda no Colab; repo guarda só código e .md ([docs/colab.md](docs/colab.md)).
- Código só em `.ipynb` dentro de `src/` ([ADR 0008](docs/decisions/0008-somente-notebooks.md)): nunca ler o notebook inteiro, só células de código necessárias; limpar saídas antes de salvar, exceto EDA e avaliação.
- Antes de afirmar nome de peso/versão do Ultralytics, conferir na documentação.
