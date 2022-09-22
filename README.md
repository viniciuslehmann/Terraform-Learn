# Terraform-Learn

Reposítorio de arquivos criados durante meu aprendizado da tecnologia da Hashicorp, <b>Terraform</b>.

# Terraform AWS

<h2>VPC e NAT</h2>

<p>O projeto abaixo defini a criação de 6 sub-redes, sendo 3 sub-redes públicas e 3 sub-redes privadas em 3 zonas de disponibilidades diferentes dentro da mesma região.
É sugerido a criação de um Internet Gateway para permitir a comunicação com a internet e nas redes públicas é permitido o mapeamento de IP's públicos aos recursos criados
nestas sub-redes. Também é criado um NAT Gateway para comunicação com a internet dos recursos criados nas redes privadas.

Projeto criado para fins de aprendizado da tecnologia Terraform.</p>


<img src="terraform-aws/VPC and NAT/diagram-vpc.png" alt="Alt text" title="Optional title">
