# Processo de Aprendizado em Terraform

Reposítorio de arquivos criados durante meu aprendizado da tecnologia da Hashicorp, <b>Terraform</b>.

# Terraform Basics

Contém arquivos criados durante o aprendizado dos conceitos básicos do Terraform:

<ul>
<li>Variáveis e Outputs</li>
<li>Data Source</li>
<li>Providers</li>
</ul>

# Terraform AWS

<h2>VPC e NAT</h2>

<p>O projeto abaixo defini a criação de 6 sub-redes, sendo 3 sub-redes públicas e 3 sub-redes privadas em 3 zonas de disponibilidades diferentes dentro da mesma região.
É sugerido a criação de um Internet Gateway para permitir a comunicação com a internet e nas redes públicas é permitido o mapeamento de IP's públicos aos recursos criados
nestas sub-redes. Também é criado um NAT Gateway para comunicação com a internet dos recursos criados nas redes privadas.

Projeto criado para fins de aprendizado da tecnologia Terraform.</p>


<img src="terraform-aws/VPC and NAT/diagram-vpc.png" alt="Alt text" title="Optional title">

<h4>26/09/2022</h3>

Inclusões no projeto:
<ul>
    <li>NAT Gateway na sub-rede main-public-1</li>
    <li>Instância EC2 com dois volumes EBS</li>
    <li>Banco de dados RDS na sub-rede main-private-1 e regras de security group para acesso</li>
    <li>Scripts de Inicialização com Cloud Init e Shell Script para atualização do sistema e inclusão do volume EBS no arquivo FSTAB</li>
</ul>

<img src="terraform-aws\VPC and NAT\diagrama AWS VPC-v2.png" alt="Alt text" title="Optional title">


<h2>Terraform + Jenkins + Packer</h2>

<p>Projeto utilizando AWS como Cloud Provider, Jenkins e Packer para automatização e criação de AMI's.

Implementação em andamento!</p>
<img src="terraform-aws\Jenkins-Packer\jenkins-packer.png" alt="Alt text" title="Optional title">
