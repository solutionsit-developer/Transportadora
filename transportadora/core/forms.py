from django import forms
from .models import Cliente, Motorista, Pedido, Entrega
from django.contrib.auth.forms import AuthenticationForm

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = '__all__'
        
class CadastroUnificadoForm(forms.Form):
    nome = forms.CharField(label="Nome", max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    cpf_cnpj = forms.CharField(label="CPF ou CNPJ", max_length=20, widget=forms.TextInput(attrs={'class': 'form-control'}))
    rg = forms.CharField(label="RG", max_length=20, widget=forms.TextInput(attrs={'class': 'form-control'}))

    cnh_numero = forms.CharField(
        label="Número da CNH", max_length=20,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    cnh_categoria = forms.CharField(
        label="Categoria da CNH", max_length=5,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    validade_cnh = forms.DateField(
        label="Validade da CNH",
        required=False,
        widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control'})
    )

    email = forms.EmailField(label="E-mail", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    telefone = forms.CharField(label="Telefone", max_length=20, widget=forms.TextInput(attrs={'class': 'form-control'}))
    endereco = forms.CharField(label="Endereço", max_length=150, widget=forms.TextInput(attrs={'class': 'form-control'}))
    cidade = forms.CharField(label="Cidade", max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    estado = forms.CharField(label="Estado", max_length=2, widget=forms.TextInput(attrs={'class': 'form-control'}))
    cep = forms.CharField(label="CEP", max_length=10, widget=forms.TextInput(attrs={'class': 'form-control'}))
    ie = forms.CharField(label="Inscrição Estadual", max_length=30, widget=forms.TextInput(attrs={'class': 'form-control'}))

    tipo_cliente = forms.ChoiceField(
        choices=[('PF', 'Pessoa Física'), ('PJ', 'Pessoa Jurídica')],
        label="Tipo de Cliente",
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    
    username = forms.CharField(
        label='Usuário',
        max_length=150,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    password = forms.CharField(
        label='Senha',
        widget=forms.PasswordInput(attrs={'class': 'form-control'})
    )
    password_confirm = forms.CharField(
        label='Confirme a Senha',
        widget=forms.PasswordInput(attrs={'class': 'form-control'})
    )

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        password_confirm = cleaned_data.get("password_confirm")

        if password and password_confirm and password != password_confirm:
            raise forms.ValidationError("As senhas não coincidem.")

class LoginForm(AuthenticationForm):
    username = forms.CharField(
        label='Usuário',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Digite seu usuário'})
    )
    password = forms.CharField(
        label='Senha',
        widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Digite sua senha'})
    )
    
class MotoristaForm(forms.ModelForm):
    class Meta:
        model = Motorista
        fields = '__all__'

class PedidoForm(forms.ModelForm):
    class Meta:
        model = Pedido
        fields = '__all__'

class EntregaForm(forms.ModelForm):
    class Meta:
        model = Entrega
        fields = '__all__'
