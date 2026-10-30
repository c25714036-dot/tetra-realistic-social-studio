import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_tetra_preset_is_valid():
    data = json.loads((ROOT / 'config' / 'presets' / 'tetra-capital.json').read_text(encoding='utf-8'))
    assert data['brand']['navy'] == '#0e2538'
    assert '4x5' in data['formats']
    assert 'comercio-local' in data['scenes']
