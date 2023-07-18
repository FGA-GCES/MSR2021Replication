# Bem-vindo ao guia de contribuição do StackOverflow Mining <!-- omit in toc -->

Obrigado por investir seu tempo em contribuir com nosso projeto! :sparkles:.

Leia nosso [Código de Conduta](./code_of_conduct_PT_BR.md) para manter nossa comunidade acessível e respeitável.

Neste guia, você terá uma visão geral do fluxo de trabalho de contribuição desde a abertura de um problema, criação de um PR, revisão e fusão do PR.

## Novo guia do colaborador

Para obter uma visão geral do projeto, leia o [README](intro.md).

Categorizamos nossos problemas avaliando duas métricas:
- Nível de habilidade
- Funcionalidade
Veja na [guia de rótulos](https://github.com/FGA-GCES/MSR2021Replication/labels).


## Começando

Para entender a estrutura de arquivos do projeto, dê uma olhada em [Introdução](./getting_started_PT_BR.md).


### Issues

#### Criar um novo issue

Se você identificar um issue com os documentos ou código, verifique se já existe um problema.

Se um problema relacionado não existir, você pode abrir um novo problema, como regra, dois tipos de [formulário de problema](https://github.com/FGA-GCES/MSR2021Replication/tree/docs_contributing/.github/ISSUE_TEMPLATE) são usado.

eles são:
- [Relatório de bug](./issues/bug_report.md) e o [Padrão](./issues/standard.md)

#### Resolver um issue

Revise nossos [issues existentes](https://github.com/FGA-GCES/MSR2021Replication/issues) para encontrar um que lhe interesse. Você pode restringir sua pesquisa usando `tags` como filtros. Consulte [Rótulos](https://github.com/FGA-GCES/MSR2021Replication/labels) para obter mais informações. Como regra geral, não atribuímos problemas a ninguém. Se você encontrar um problema para resolver, poderá abrir um PR com uma correção.

### Crie branches

O repositório original deve ser bifurcado. Via de regra, não serão aceitas criações de branches no fork original.

### Política de commit

Confirme as alterações assim que estiver satisfeito com elas. Não se esqueça de seguir a política de confirmação usada neste projeto.

Visite [política de commit](./commit_politics_PT_BR.md) para obter mais informações!

### política de desenvolvimento

O código deve seguir as orientações encontradas nos documentos oficiais de cada tecnologia utilizada neste projeto.

### Pull Request

Quando terminar as alterações, crie uma solicitação pull, também conhecida como PR.
- Preencha o modelo "Pronto para revisão" para que possamos revisar seu PR. Este modelo ajuda os revisores a entender suas alterações, bem como o objetivo de sua solicitação pull.
- Não se esqueça de [vincular PR ao problema](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue ) se você estiver resolvendo um.
- Ative a caixa de seleção para [permitir edições do mantenedor](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/allowing-changes-to-a-pull-request-branch -created-from-a-fork) para que a ramificação possa ser atualizada para uma mesclagem.
Depois de enviar seu PR, um membro da equipe do Documentos revisará sua proposta. Podemos fazer perguntas ou solicitar informações adicionais.
- Podemos solicitar alterações antes que um PR possa ser mesclado, usando [alterações sugeridas](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/incorporating -feedback-in-your-pull-request) ou comentários de pull request. Você pode aplicar as alterações sugeridas diretamente por meio da interface do usuário. Você pode fazer quaisquer outras alterações em seu fork e, em seguida, confirmá-las em seu branch.
- Ao atualizar seu PR e aplicar as alterações, marque cada conversa como [resolvida](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/commenting-on-a- pull-request#resolvendo-conversas).
- Se você tiver algum problema de mesclagem, verifique este [tutorial git](https://github.com/skills/resolve-merge-conflicts) para ajudá-lo a resolver conflitos de mesclagem e outros problemas.