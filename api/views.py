from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import HelloSerializer

class HelloView(APIView):
    def get(self, request):
        return Response({"message": "Hello, world!"})
