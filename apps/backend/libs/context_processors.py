import os
from django.conf import settings


def settings_context(request):
    if not settings.DEBUG:
        return {}

    CLIENT_DEV_HOST = os.getenv('CLIENT_DEV_HOST', 'localhost:5173')

    return {
        'DEBUG': settings.DEBUG,
        'CLIENT_DEV_HOST': f'http://{CLIENT_DEV_HOST}'
    }
