from django.db import models

from django.db import models

class Cliente(models.Model):
    nome = models.CharField(max_length=100)
    cpf_cnpj = models.CharField(max_length=20)
    email = models.EmailField(max_length=100)
    telefone = models.CharField(max_length=20)
    endereco = models.CharField(max_length=150)
    cidade = models.CharField(max_length=50)
    estado = models.CharField(max_length=2)
    cep = models.CharField(max_length=10)
    ie = models.CharField(max_length=30, blank=True, null=True)
    tipo_cliente = models.CharField(max_length=20)
    status = models.CharField(max_length=20)
    data_cadastro = models.DateField()

    def __str__(self):
        return self.nome


class Motorista(models.Model):
    nome = models.CharField(max_length=100)
    cpf = models.CharField(max_length=20)
    rg = models.CharField(max_length=20)
    cnh_numero = models.CharField(max_length=20)
    cnh_categoria = models.CharField(max_length=5)
    validade_cnh = models.DateField()
    email = models.EmailField(max_length=100)
    telefone = models.CharField(max_length=20)
    endereco = models.CharField(max_length=150)
    cidade = models.CharField(max_length=50)
    estado = models.CharField(max_length=2)
    data_cadastro = models.DateField()

    def __str__(self):
        return self.nome


class Pedido(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    data_pedido = models.DateField()
    prazo_entrega_previsto = models.DateField()
    data_entrega_real = models.DateField(blank=True, null=True)
    valor_total = models.DecimalField(max_digits=10, decimal_places=2)
    forma_pagamento = models.CharField(max_length=30)
    prioridade = models.CharField(max_length=10)
    status = models.CharField(max_length=20)
    observacoes = models.TextField(blank=True, null=True)
    criado_por = models.CharField(max_length=50)
    data_criacao = models.DateField()

    def __str__(self):
        return f"Pedido #{self.id} - Cliente: {self.cliente.nome}"


class Entrega(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    motorista = models.ForeignKey(Motorista, on_delete=models.SET_NULL, null=True, blank=True)
    cte_numero = models.CharField(max_length=20)
    cte_chave_acesso = models.CharField(max_length=44)
    cte_data_emissao = models.DateField()
    cte_status_sefaz = models.CharField(max_length=20)
    cte_xml = models.TextField()
    data_saida = models.DateField()
    data_prevista_entrega = models.DateField()
    data_entrega = models.DateField(blank=True, null=True)
    status = models.CharField(max_length=20)
    criado_por = models.CharField(max_length=50)
    data_criacao = models.DateField()

    def __str__(self):
        return f"Entrega do pedido #{self.pedido.id}"
