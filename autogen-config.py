#!/usr/bin/env python3

import subprocess


class Command:
    def __init__(self, command: str, *args):
        # 初始化命令和参数
        self.command = command
        self.args = args

    def run(self):
        # 运行命令并实时打印输出
        try:
            # 将命令和参数合并
            full_command = [self.command] + list(self.args)
            print(f"Running command: {' '.join(full_command)}")

            # 使用 subprocess 运行命令并实时捕获输出
            result = subprocess.run(
                full_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
            )

            # 打印 stdout 和 stderr
            if result.stdout:
                print(result.stdout, end="")  # 打印标准输出
            if result.stderr:
                print(result.stderr, end="")  # 打印错误输出

            return result.returncode  # 返回命令的状态码

        except Exception as e:
            print(f"Error occurred while running command: {e}")
            return 1  # 出错时返回 1

    def __str__(self):
        # 方便打印命令
        return f"Command({self.command}, {', '.join(self.args)})"


def check_dependency(tools: list):
    pass


def config_vim():
    pass


def config_omz():
    pass


def config_tmux():
    pass


def main():
    pass


if __name__ == "__main__":
    main()
