"""
Cloud Functions entry point
"""
import functions_framework
from app import create_app

app = create_app()

@functions_framework.http
def main(request):
    with app.request_context(request.environ):
        return app.full_dispatch_request()
