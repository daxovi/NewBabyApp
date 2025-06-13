#!/usr/bin/env python3
import re
import glob
import argparse
from pathlib import Path

def load_mapping(strings_path: str) -> dict:
    """
    Načte Localizable.strings a vrátí slovník {hodnota: klíč}.
    """
    mapping = {}
    pattern = re.compile(r'^\s*"(?P<key>.*?)"\s*=\s*"(?P<value>.*?)";')
    with open(strings_path, encoding='utf-8') as f:
        for line in f:
            m = pattern.match(line)
            if m:
                mapping[m.group('value')] = m.group('key')
    return mapping

def replace_in_file(file_path: Path, mapping: dict) -> None:
    """
    Provede nahrazení všech literálů podle mapy na "klíč".localizedString v zadaném souboru.
    """
    try:
        content = file_path.read_text(encoding='utf-8')
    except IsADirectoryError:
        return
    original = content
    for value, key in mapping.items():
        content = re.sub(rf'"{re.escape(value)}"', f'"{key}".localizedString', content)
    if content != original:
        file_path.write_text(content, encoding='utf-8')
        print(f"Updated {file_path}")

def main():
    parser = argparse.ArgumentParser(
        description="Bulk replace Swift string literals by .localizedString keys.")
    parser.add_argument('strings',
                        help='Cesta k Localizable.strings (např. ./cs.lproj/Localizable.strings)')
    parser.add_argument('swift_glob',
                        help="Glob pattern pro Swift soubory, např. './App/**/*.swift'")
    args = parser.parse_args()

    mapping = load_mapping(args.strings)
    raw = glob.glob(args.swift_glob, recursive=True)
    files = [Path(f) for f in raw if Path(f).is_file()]

    for file in files:
        replace_in_file(file, mapping)
    print(f"Hotovo. Zpracováno {len(files)} souborů.")

if __name__ == '__main__':
    main()