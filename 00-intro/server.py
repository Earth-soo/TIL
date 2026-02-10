# ctrl + `으로 터미널 열기
# 커스텀 서버 만드는 코드

from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    # 응답
    return "<p>Hello, World!</p>"

@app.route("/qwer") # URL
def about():
    # 응답
    return "<p>Good Bye</p>"

if __name__ == '__main__':
    app.run(port=3000, debug=True)
