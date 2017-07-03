<h1 align="center">CheckSO</h1>
<p align="center">Identifique o SO(Sistema Operacional) da máquina "pingada"</p>
<hr>

## :exclamation: Atenção: 

Na maioria dos sistemas operacionais é possivel fazer uma alteração no retorno do **TTL**, que no script é ultilizado para a identificação do sistema. Todavia este script assim como o repositório como um todo é apenas um **DICA** de ultilização dessa funcionaliade. :wink:

## O que é o protocolo ICMP ?
**ICMP**, sigla para o inglês **Internet Control Message Protocol**, é um protocolo integrante do Protocolo **IP**, definido pelo 
**RFC 792**, é utilizado para fornecer relatórios de erros à fonte original. Qualquer computador que utilize IP precisa aceitar as mensagens **ICMP** e alterar o seu comportamento de acordo com o erro relatado. Os **gateways** devem estar programados para enviar mensagens **ICMP** quando receberem datagramas que provoquem algum erro. <br>
[Fonte: Wikipedia](https://pt.wikipedia.org/wiki/Internet_Control_Message_Protocol)

## Sobre o Script
"O comando **ping** trabalha com o protocolo **ICMP** enviando mensagens. Quando uma maquina de destino recebe um **ECHO_REQUEST** ela retorna um **ECHO_REPLY**."
<br/>
Com isso há utilização do programa **ping** seria: <br />

Requisição para máquina: Linux
```
PING 192.168.2.16 (192.168.2.16) 56(84) bytes of data.
64 bytes from 192.168.2.16: icmp_seq=1 ttl=64 time=0.082 ms
64 bytes from 192.168.2.16: icmp_seq=2 ttl=64 time=0.076 ms
64 bytes from 192.168.2.16: icmp_seq=3 ttl=64 time=0.065 ms
64 bytes from 192.168.2.16: icmp_seq=4 ttl=64 time=0.082 ms
```
<br />

Requisição para máquina: Windows
```
PING 192.168.2.11 (192.168.2.11) 56(84) bytes of data.
64 bytes from 192.168.2.11: icmp_seq=1 ttl=128 time=368 ms
64 bytes from 192.168.2.11: icmp_seq=2 ttl=128 time=113 ms
64 bytes from 192.168.2.11: icmp_seq=3 ttl=128 time=312 ms
64 bytes from 192.168.2.11: icmp_seq=4 ttl=128 time=127 ms

```
<br />

Peceba que o TTL (Time to Live) de cada requisão exerce "um padrão" para cada sistema operacional demostrado acima. Com isso podemos verificar e saber qual sistema a máquina está utilizando.<br/>

Exemplo do teste:
```shell
if [ $valorSO -eq 64  ]
 then
 echo "[-] Sistema Operacional : aproximadamente - GNU/Linux"
fi
```

<br/>

### :warning: Obs:
Também é válido resaltar que a cada vez que um pacote passa por um roteador, o mesmo decrementa 2 no valor do TTL, Sendo assim o valor talvez tenha que ser ajustado,ou simplismente reavaliado as verificações do "test

## License
MIT <https://opensource.org/licenses/MIT>
