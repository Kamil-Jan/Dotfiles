#!/usr/bin/env python
import os
import webbrowser
import argparse
import sys
import mosspy

ext2moss_lang = {
    ".c": "c",
    ".cpp": "cc",
    ".h": "cc",
    ".java": "java",
    ".py": "python",
    ".pyc": "python",
}


def get_ext(file_path):
    _, file_extension = os.path.splitext(file_path)
    return file_extension


def run_moss(student_files, lang):
    userid = 12345
    m = mosspy.Moss(userid, lang)
    for student_file in student_files:
        m.addFile(student_file)
    return m.send()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-f", "--files", nargs="+", help="File paths", required=True)
    parser.add_argument("-l", "--lang", help="Programming language", required=False)
    args = parser.parse_args()

    if args.lang and args.lang not in ext2moss_lang.values():
        print(f"Unsupported language. Supported: {ext2moss_lang.values()}")
        sys.exit()

    files = args.files
    if len(files) < 2:
        print(f"Got {len(files)} file, expected 2 or more")
        sys.exit()
    valid_files = []
    for file in files:
        if not os.path.isfile(file):
            print(f"Filepath '{file}' is invalid")
            sys.exit()
        ext = get_ext(file)
        if ext not in ext2moss_lang:
            print(
                f"File extension '{ext}' is not supported. Available: {ext2moss_lang.keys()}"
            )
            sys.exit()
        valid_files.append(file)
    url = run_moss(
        valid_files,
        lang=args.lang if args.lang else ext2moss_lang[get_ext(valid_files[0])]
    )

    print(url)
    try:
        webbrowser.open(url, new=0, autoraise=True)
    except:
        pass
