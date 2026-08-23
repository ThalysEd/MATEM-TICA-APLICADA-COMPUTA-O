import pandas as pd


dados_vendas = {
    'Data': ['2024-01-01', '2024-01-02', '2024-01-03', '2024-01-04', '2024-01-05'],
    'Produto': ['Notebook', 'Mouse', 'Notebook', 'Teclado', 'Mouse'],
    'Quantidade': [2, 5, 1, 3, 2],
    'Preço': [3500, 50, 3500, 150, 50],
    'Vendedor': ['Ana', 'Bruno', 'Ana', 'Carla', 'Bruno']
}

df = pd.DataFrame(dados_vendas)
print("Dados originais:")
print(df)


df['Receita'] = df['Quantidade'] * df['Preço']


vendas_altas = df[df['Receita'] > 1000]
print("\nVendas acima de R$ 1000:")
print(vendas_altas)


vendas_por_vendedor = df.groupby('Vendedor')['Receita'].sum()
print("\nReceita por vendedor:")
print(vendas_por_vendedor)


print("\nEstatísticas da receita:")
print(f"Total: R$ {df['Receita'].sum():.2f}")
print(f"Média: R$ {df['Receita'].mean():.2f}")
print(f"Máximo: R$ {df['Receita'].max():.2f}")