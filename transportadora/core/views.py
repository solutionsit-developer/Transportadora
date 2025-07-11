from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import ClienteForm, LoginForm, CadastroUnificadoForm
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from .models import Cliente, Motorista
from django.utils import timezone

def login_view(request):
    if request.method == 'POST':
        form = LoginForm(data=request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password']
            )
            if user is not None:
                login(request, user)
                return redirect('home')
    else:
        form = LoginForm()
    
    return render(request, 'login.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('login')

def cadastro_view(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Usuário criado com sucesso! Faça login.')
            return redirect('login')
    else:
        form = UserCreationForm()
    
    return render(request, 'cadastro.html', {'form': form})

def cadastro_completo_view(request):
    if request.method == 'POST':
        form = CadastroUnificadoForm(request.POST)
        if form.is_valid():
            
            user = User.objects.create_user(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password']
            )
            
            user = authenticate(username=form.cleaned_data['username'], password=form.cleaned_data['password'])
            if user is not None:
                login(request, user)
                
            cliente = Cliente.objects.create(
                nome=form.cleaned_data['nome'],
                cpf_cnpj=form.cleaned_data['cpf_cnpj'],
                email=form.cleaned_data['email'],
                telefone=form.cleaned_data['telefone'],
                endereco=form.cleaned_data['endereco'],
                cidade=form.cleaned_data['cidade'],
                estado=form.cleaned_data['estado'],
                cep=form.cleaned_data['cep'],
                ie=form.cleaned_data['ie'],
                tipo_cliente=form.cleaned_data['tipo_cliente'],
                status='Ativo',
                data_cadastro=timezone.now().date()
            )

            Motorista.objects.create(
                nome=form.cleaned_data['nome'],
                cpf=form.cleaned_data['cpf_cnpj'],
                rg=form.cleaned_data['rg'],
                cnh_numero=form.cleaned_data['cnh_numero'],
                cnh_categoria=form.cleaned_data['cnh_categoria'],
                validade_cnh=form.cleaned_data['validade_cnh'],
                email=form.cleaned_data['email'],
                telefone=form.cleaned_data['telefone'],
                endereco=form.cleaned_data['endereco'],
                cidade=form.cleaned_data['cidade'],
                estado=form.cleaned_data['estado'],
                data_cadastro=timezone.now().date()
            )

            messages.success(request, 'Cadastro completo realizado com sucesso!')
            return redirect('login')
    else:
        form = CadastroUnificadoForm()

    return render(request, 'cadastro_completo.html', {'form': form})

@login_required
def home(request):
    return render(request, 'home.html')

@login_required
def cliente_list(request):
    clientes = Cliente.objects.all()
    return render(request, 'cliente/list.html', {'clientes': clientes})

@login_required
def cliente_create(request):
    form = ClienteForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('cliente_list')
    return render(request, 'cliente/create.html', {'form': form})

@login_required
def cliente_update(request, pk):
    cliente = get_object_or_404(Cliente, pk=pk)
    form = ClienteForm(request.POST or None, instance=cliente)
    if form.is_valid():
        form.save()
        return redirect('cliente_list')
    return render(request, 'cliente/update.html', {'form': form})

@login_required
def cliente_delete(request, pk):
    cliente = get_object_or_404(Cliente, pk=pk)
    if request.method == 'POST':
        cliente.delete()
        return redirect('cliente_list')
    return render(request, 'cliente/delete.html', {'cliente': cliente})

# MOTORISTA
@login_required
def motorista_list(request):
    motoristas = Motorista.objects.all()
    return render(request, 'motorista/list.html', {'motoristas': motoristas})

@login_required
def motorista_create(request):
    form = MotoristaForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('motorista_list')
    return render(request, 'motorista/create.html', {'form': form})

@login_required
def motorista_update(request, pk):
    motorista = get_object_or_404(Motorista, pk=pk)
    form = MotoristaForm(request.POST or None, instance=motorista)
    if form.is_valid():
        form.save()
        return redirect('motorista_list')
    return render(request, 'motorista/update.html', {'form': form})

@login_required
def motorista_delete(request, pk):
    motorista = get_object_or_404(Motorista, pk=pk)
    if request.method == 'POST':
        motorista.delete()
        return redirect('motorista_list')
    return render(request, 'motorista/delete.html', {'motorista': motorista})


# PEDIDO
@login_required
def pedido_list(request):
    pedidos = Pedido.objects.all()
    return render(request, 'pedido/list.html', {'pedidos': pedidos})

@login_required
def pedido_create(request):
    form = PedidoForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('pedido_list')
    return render(request, 'pedido/create.html', {'form': form})

@login_required
def pedido_update(request, pk):
    pedido = get_object_or_404(Pedido, pk=pk)
    form = PedidoForm(request.POST or None, instance=pedido)
    if form.is_valid():
        form.save()
        return redirect('pedido_list')
    return render(request, 'pedido/update.html', {'form': form})

@login_required
def pedido_delete(request, pk):
    pedido = get_object_or_404(Pedido, pk=pk)
    if request.method == 'POST':
        pedido.delete()
        return redirect('pedido_list')
    return render(request, 'pedido/delete.html', {'pedido': pedido})


# ENTREGA
@login_required
def entrega_list(request):
    entregas = Entrega.objects.all()
    return render(request, 'entrega/list.html', {'entregas': entregas})

@login_required
def entrega_create(request):
    form = EntregaForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('entrega_list')
    return render(request, 'entrega/create.html', {'form': form})

@login_required
def entrega_update(request, pk):
    entrega = get_object_or_404(Entrega, pk=pk)
    form = EntregaForm(request.POST or None, instance=entrega)
    if form.is_valid():
        form.save()
        return redirect('entrega_list')
    return render(request, 'entrega/update.html', {'form': form})

@login_required
def entrega_delete(request, pk):
    entrega = get_object_or_404(Entrega, pk=pk)
    if request.method == 'POST':
        entrega.delete()
        return redirect('entrega_list')
    return render(request, 'entrega/delete.html', {'entrega': entrega})
