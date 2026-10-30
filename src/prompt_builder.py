#!/usr/bin/env python3
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

BASE_POSITIVE = (
    "photorealistic editorial photography, authentic Brazilian professional, "
    "natural facial proportions, realistic skin texture, physically plausible hands, "
    "believable posture, candid moment, realistic hair and textiles, premium but believable environment, "
    "no text, no logo"
)

BASE_NEGATIVE = (
    "CGI, 3D render, synthetic skin, wax skin, over-retouched face, uncanny eyes, "
    "extra fingers, malformed hands, fake smile, neon holograms, cyberpunk, floating charts, "
    "random text, watermark, logo, stock-photo cliché"
)


def load_preset(name: str):
    path = ROOT / "config" / "presets" / f"{name}.json"
    if not path.exists():
        raise SystemExit(f"Preset não encontrado: {path}")
    return json.loads(path.read_text(encoding="utf-8"))


def main():
    parser = argparse.ArgumentParser(description="Gera prompt fotográfico para social media")
    parser.add_argument("--preset", default="tetra-capital")
    parser.add_argument("--scene", default="comercio-local")
    parser.add_argument("--format", default=None, choices=["4x5", "9x16", "1x1"])
    parser.add_argument("--subject", default="")
    parser.add_argument("--action", default="")
    args = parser.parse_args()

    preset = load_preset(args.preset)
    fmt = args.format or preset["defaultFormat"]
    scene = preset.get("scenes", {}).get(args.scene, args.scene)
    photo = preset["photography"]
    format_info = preset["formats"][fmt]

    parts = [
        BASE_POSITIVE,
        photo["style"],
        photo["people"],
        photo["lighting"],
        photo["lens"],
        photo["composition"],
        scene,
    ]
    if args.subject:
        parts.append(args.subject)
    if args.action:
        parts.append(args.action)

    negative = BASE_NEGATIVE + ", " + ", ".join(photo["avoid"])

    print("\n=== POSITIVE PROMPT ===\n")
    print(", ".join(p for p in parts if p))
    print("\n=== NEGATIVE PROMPT ===\n")
    print(negative)
    print("\n=== FORMAT ===\n")
    print(f"{fmt}: {format_info['width']}x{format_info['height']} — {format_info['usage']}")


if __name__ == "__main__":
    main()
