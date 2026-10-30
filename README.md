# Tetra Realistic Social Studio

Hub local para produção de imagens fotorealistas de pessoas para redes sociais, com foco em consistência de identidade, fotografia corporativa/lifestyle e formatos 4:5 e 9:16.

O projeto **não redistribui código/modelos de terceiros**. Ele organiza instalação, atualização, presets e workflows em torno de projetos upstream.

## Stack integrada

- **ComfyUI** — motor principal e API por nós.
- **FLUX.2** — geração/edição de alta qualidade.
- **ComfyUI-Photoshoot** — série fotográfica consistente com variação de pose, enquadramento e expressão.
- **InstantID** — preservação de identidade a partir de referência facial.
- **PhotoMaker** — identidade consistente com múltiplas referências.
- **Vicii Influencer HyperRealism** — referência para fotografia estilo smartphone/UGC hiper-realista.
- **Zakaru AI Image Generator** — referência de acabamento para retratos/moda.
- **AI Ecom Brand Pipeline** — referência de lifestyle/e-commerce e fotografia de marca.
- **Fooocus** — modo simples/rápido para geração fotográfica.

## Filosofia

1. Gerar **a fotografia sem texto, logotipo ou layout**.
2. Manter identidade do personagem usando InstantID/PhotoMaker.
3. Criar variações com Photoshoot.
4. Refinar pele, mãos, detalhes e upscale.
5. Finalizar tipografia e branding em Photoshop/Figma/Canva.

Essa separação reduz artefatos de IA e evita texto deformado dentro da imagem.

## Instalação rápida — Windows PowerShell

Pré-requisitos recomendados:

- Windows 11
- Git
- Python 3.11+
- GPU NVIDIA compatível com PyTorch/CUDA para melhor desempenho

No PowerShell:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\windows\bootstrap.ps1
```

Depois:

```powershell
.\scripts\windows\studio.ps1
```

O menu permite instalar/atualizar componentes, abrir documentação e iniciar o ComfyUI/Fooocus.

## Perfis de instalação

### Core
Instala:
- ComfyUI
- ComfyUI-Photoshoot
- InstantID (repositório oficial de referência)
- FLUX.2 (repositório oficial de referência)

### Creator
Core +:
- Fooocus
- PhotoMaker
- Zakaru

### Research
Creator + repositórios sem licença SPDX detectada automaticamente:
- Vicii Influencer HyperRealism
- odhasu/comfyui (pipeline e-commerce de referência)

> O perfil Research exige aceite explícito porque alguns repositórios não declaram licença de forma padronizada no GitHub.

## Preset Tetra Capital

Arquivo: `config/presets/tetra-capital.json`

Diretrizes principais:
- formato 4:5 como padrão;
- pessoas com traços brasileiros;
- fotografia corporativa humanizada;
- azul-marinho `#0e2538`;
- dourado `#d7b46a`;
- off-white `#fcf6ec`;
- ambientes corporativos e comércio local;
- evitar aparência futurista, pele plástica e estética genérica de banco de imagens;
- reservar área negativa para texto aplicado posteriormente no design.

## Estrutura

```text
config/                 presets e catálogo de upstreams
docs/                   arquitetura, pipelines e licenças
prompts/                biblioteca de prompts fotográficos
scripts/windows/        instalação, atualização e launcher PowerShell
src/                    utilitários locais
workflows/              especificações de pipelines ComfyUI
external/               clones locais dos upstreams (ignorado pelo Git)
assets/                  referências próprias do projeto
```

## Uso recomendado para social media

### Post 4:5

```powershell
python .\src\prompt_builder.py --preset tetra-capital --scene comercio-local --format 4x5
```

### Story/Reel 9:16

```powershell
python .\src\prompt_builder.py --preset tetra-capital --scene reuniao-consultiva --format 9x16
```

O utilitário retorna um prompt positivo, negativo e parâmetros sugeridos. A geração é executada no motor escolhido.

## Atualização dos projetos upstream

```powershell
.\scripts\windows\update-upstreams.ps1
```

## Segurança e privacidade

- Não versionar fotos privadas de referência.
- `assets/private/`, modelos e outputs estão no `.gitignore`.
- Obtenha consentimento para uso de imagem de pessoas reais.
- Não use identidade de terceiros para publicidade sem autorização.

## Licenças

Este hub pode usar licença MIT para os arquivos autorais do projeto, mas **cada upstream e cada modelo mantém sua própria licença**. Veja `docs/LICENSES.md` antes de uso comercial.
