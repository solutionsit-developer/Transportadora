from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    #path('cadastro/', views.cadastro_view, name='cadastro'),
    path('cadastro-completo/', views.cadastro_completo_view, name='cadastro_completo'),
    
    path('contato/', views.contato_view, name='contato'),

    path('clientes/', views.cliente_list, name='cliente_list'),
    path('clientes/novo/', views.cliente_create, name='cliente_create'),
    path('clientes/<int:pk>/editar/', views.cliente_update, name='cliente_update'),
    path('clientes/<int:pk>/deletar/', views.cliente_delete, name='cliente_delete'),
    
    # Motorista
    path('motoristas/', views.motorista_list, name='motorista_list'),
    path('motoristas/novo/', views.motorista_create, name='motorista_create'),
    path('motoristas/<int:pk>/editar/', views.motorista_update, name='motorista_update'),
    path('motoristas/<int:pk>/deletar/', views.motorista_delete, name='motorista_delete'),

    # Pedido
    path('pedidos/', views.pedido_list, name='pedido_list'),
    path('pedidos/novo/', views.pedido_create, name='pedido_create'),
    path('pedidos/<int:pk>/editar/', views.pedido_update, name='pedido_update'),
    path('pedidos/<int:pk>/deletar/', views.pedido_delete, name='pedido_delete'),

    # Entrega
    path('entregas/', views.entrega_list, name='entrega_list'),
    path('entregas/novo/', views.entrega_create, name='entrega_create'),
    path('entregas/<int:pk>/editar/', views.entrega_update, name='entrega_update'),
    path('entregas/<int:pk>/deletar/', views.entrega_delete, name='entrega_delete'),
]
