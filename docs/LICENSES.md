# Licenças e uso comercial

Este repositório é um **orquestrador**. Projetos externos são clonados em `external/` e não fazem parte da distribuição deste código.

Estado detectado no GitHub em 2026-10-30:

| Projeto | Licença reportada |
|---|---|
| ComfyUI | GPL-3.0 |
| FLUX.2 inference repo | Apache-2.0 |
| ComfyUI-Photoshoot | MIT |
| InstantID | Apache-2.0 |
| Fooocus | GPL-3.0 |
| Zakaru AI Image Generator | Apache-2.0 |
| PhotoMaker | NOASSERTION no metadata do GitHub |
| Vicii Influencer HyperRealism | não declarada no metadata |
| odhasu/comfyui | não declarada no metadata |

## Importante

A licença do **código** não determina automaticamente a licença dos **pesos/modelos** usados pelo pipeline. Modelos do Hugging Face, checkpoints, LoRAs e outros assets podem possuir termos diferentes, inclusive restrições comerciais.

Antes de usar em cliente ou campanha paga:

1. conferir LICENSE do repositório;
2. conferir licença do checkpoint/modelo;
3. conferir licença de LoRAs e embeddings;
4. confirmar direito de uso das imagens de referência;
5. registrar a origem dos componentes usados no job.

Por segurança, o bootstrap não instala automaticamente projetos com licença não declarada.
