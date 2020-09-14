from rest_framework import permissions
class IsCorrectorReadWrite(permissions.IsAuthenticated):
    
    # def has_permission(self, request, view):
    #     return super().has_permission(request, view)

    def has_object_permission(self, request, view, obj):
        if request.user.is_corrector:
            return True
        else:
            return obj == request.user
        # return super().has_object_permission(request, view, obj)