# Arquitetura

## Objetivo

Unificar diferentes abordagens de geração realista sem forçar todos os projetos a compartilhar o mesmo ambiente Python.

## Camadas

### 1. Orquestração
Este repositório contém presets, scripts e documentação. Não carrega pesos de modelos.

### 2. Engine principal
**ComfyUI** é o motor recomendado porque permite pipelines modulares, API e workflows reproduzíveis.

### 3. Identidade
- **InstantID**: referência única e rápida.
- **PhotoMaker**: múltiplas referências e consistência de identidade.

### 4. Sessão fotográfica
- **ComfyUI-Photoshoot**: variar pose, framing, expressão, placement e aspect ratio mantendo o personagem.

### 5. Realismo/lifestyle
- **Vicii**: referência para aparência de captura móvel/UGC.
- **Zakaru**: referência de acabamento de retratos.
- **AI Ecom Brand Pipeline**: referência para lifestyle, produto e fotografia de marca.

### 6. Modo simples
**Fooocus** serve como interface de geração rápida quando não é necessária uma cadeia complexa.

## Por que não misturar tudo num único requirements.txt?

Os upstreams usam versões diferentes de PyTorch, Diffusers, CUDA e dependências nativas. Isolá-los evita quebrar o ambiente principal. O launcher mantém cada projeto em `external/<id>`.

## Fluxo recomendado

```text
Referência do personagem
        ↓
InstantID / PhotoMaker
        ↓
FLUX / modelo fotográfico
        ↓
Photoshoot (pose/framing/expression)
        ↓
Detail pass / skin / hands / upscale
        ↓
Imagem limpa, sem texto
        ↓
Photoshop / Figma / Canva
```
