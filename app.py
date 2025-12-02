from flask import Flask, jsonify, request
import requests


def create_app():
    app = Flask(__name__)

    @app.route('/')
    def index():
        return jsonify(message="Hello from Flask boilerplate")
    
    @app.route('/test')
    def test():
        lat = request.args.get('lat', '67.8796')
        lon = request.args.get('lon', '12.9840')
        url = f"https://nominatim.openstreetmap.org/reverse?format=json&lat={lat}&lon={lon}"

        res = requests.get(url)
        print(res.content)
        return jsonify(status="ok", message = "345")

    @app.route('/health')
    def health():

        return jsonify(status="ok")

    @app.route('/echo', methods=['POST'])
    def echo():
        data = request.get_json(silent=True)



        if data is None:
            return jsonify(error="Invalid or missing JSON"), 400
        return jsonify(data)

    return app


if __name__ == '__main__':
    create_app().run(host='0.0.0.0', port=5000, debug=True)
