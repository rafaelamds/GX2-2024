<?xml version="1.0"?>
<workflow-definition
	xmlns="urn:liferay.com:liferay-workflow_7.4.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="urn:liferay.com:liferay-workflow_7.4.0 http://www.liferay.com/dtd/liferay-workflow-definition_7_4_0.xsd">
	<version>31</version>
	<state>
		<name>583be042-c39c-4795-b451-c7d6b4081d85</name>
		<description>Iniciar um fluxo de trabalho.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						399.195648596891,
						-223.1853847501769
					]
				}
			]
]
>
		</metadata>
		<actions>
			<notification>
				<name>Solicitação reembolso</name>
				<description>
					<![CDATA[]
]
>
				</description>
				<template>
					<![CDATA[Reembolso solicitado.]
]
>
				</template>
				<template-language>text</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<initial>true</initial>
		<labels>
			<label language-id="pt_BR">
				Solicitação de Reembolso
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso enviado ao gerente
					</label>
				</labels>
				<name>c08a50c1-b829-4bff-b2d3-62b721263990</name>
				<target>0b024622-cfed-4e3b-8ff0-44daecd6aea1</target>
				<default>true</default>
			</transition>
		</transitions>
	</state>
	<state>
		<name>6584c2a7-3613-40c2-af54-b02e81c2cebb</name>
		<description>Reembolso negado</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						716.9145546866224,
						416.0388969234217
					]
,
					"terminal": true
				}
			]
]
>
		</metadata>
		<actions>
			<action>
				<name>Reembolso recusado</name>
				<description>solicitação de reembolso recusada</description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onEntry</execution-type>
			</action>
			<notification>
				<name>Reembolso negado</name>
				<description>
					<![CDATA[]
]
>
				</description>
				<template>
					<![CDATA[Infelizmente sua solicitação de reembolso foi recusada por nosso departamento.]
]
>
				</template>
				<template-language>text</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<labels>
			<label language-id="pt_BR">
				Reembolso Negado
			</label>
		</labels>
	</state>
	<state>
		<name>0040afd9-bae3-4b4a-b6fb-69232347963e</name>
		<description>Concluir fluxo de trabalho.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						1543.6808923026538,
						422.1580724238438
					]
,
					"terminal": true
				}
			]
]
>
		</metadata>
		<actions>
			<action>
				<name>Reembolso aprovado</name>
				<description>solicitação aprovada e concluída.</description>
				<status>0</status>
				<priority>1</priority>
				<execution-type>onEntry</execution-type>
			</action>
			<notification>
				<name>Reembolso concluído</name>
				<description>
					<![CDATA[]
]
>
				</description>
				<template>
					<![CDATA[Seu reembolso foi aprovado por nosso departamento. O prazo da devolução é feito em até 5 dias úteis.]
]
>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<labels>
			<label language-id="pt_BR">
				Reembolso Aprovado
			</label>
		</labels>
	</state>
	<task>
		<name>0b024622-cfed-4e3b-8ff0-44daecd6aea1</name>
		<description>Vê status das solicitações, pode fazer as aprovações para passar aos outros setores, ou recursar a solicitação.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						402.6556353056289,
						70.9526475913876
					]
				}
			]
]
>
		</metadata>
		<actions>
			<action>
				<name>Reembolso em aprovação</name>
				<description>O reembolso foi aceito e será encaminhado</description>
				<status>1</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<action>
				<name>Reembolso recusado</name>
				<description>reembolso recusado pelo gerente</description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Solicitação de reembolso</name>
				<description>
					<![CDATA[]
]
>
				</description>
				<template>
					<![CDATA[Usuário solicita um reembolso.]
]
>
				</template>
				<template-language>text</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>42918</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onAssignment</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>42918</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="pt_BR">
				Gerente
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reebolso negado pelo gerente
					</label>
				</labels>
				<name>707ee441-f07a-4e51-a854-0c9a03af8693</name>
				<target>6584c2a7-3613-40c2-af54-b02e81c2cebb</target>
				<default>true</default>
			</transition>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso aprovado pelo gerente
					</label>
				</labels>
				<name>240ddfcd-5ac0-4994-b47e-bb86cb9115c6</name>
				<target>8123d13b-80f9-4df2-97ea-c09e4466a54a</target>
				<default>false</default>
			</transition>
		</transitions>
	</task>
	<task>
		<name>8123d13b-80f9-4df2-97ea-c09e4466a54a</name>
		<description>Aprova recurso do gerente, ou recusa a solicitação.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						1000.4323303993166,
						66.96517835764735
					]
				}
			]
]
>
		</metadata>
		<actions>
			<action>
				<name>solicitação de reembolso aprovada</name>
				<description>aprovado pelo diretor</description>
				<status>1</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<action>
				<name>Reembolso negado</name>
				<description>recurso negado pelo diretor</description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Solicitação de reembolso pedida pelo gerente</name>
				<description>
					<![CDATA[status de aprovação pendente]
]
>
				</description>
				<template>
					<![CDATA[Solicitação de reembolso pendente para aprovação]
]
>
				</template>
				<template-language>text</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>20101</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>20101</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="pt_BR">
				Diretor
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso aprovado pelo diretor
					</label>
				</labels>
				<name>dd37a7e7-5e67-475f-968d-1fe43d2087c1</name>
				<target>367ee135-84f2-4d3d-a5a5-6e9e012fcbc0</target>
				<default>true</default>
			</transition>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso negado pelo diretor
					</label>
				</labels>
				<name>fab664bf-8e0a-4d95-ae68-0fcc4a7782a3</name>
				<target>6584c2a7-3613-40c2-af54-b02e81c2cebb</target>
				<default>false</default>
			</transition>
		</transitions>
	</task>
	<task>
		<name>367ee135-84f2-4d3d-a5a5-6e9e012fcbc0</name>
		<description>Financeiro aprova a solicitaçao e manda para usuário.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						1541.8603587934604,
						63.68066434385105
					]
				}
			]
]
>
		</metadata>
		<actions>
			<action>
				<name>Reembolso aprovado</name>
				<description>O reembolso foi aprovado e será encaminhado ao cliente</description>
				<status>0</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Solicitação de reembolso</name>
				<description>
					<![CDATA[Solicitação de reembolso aprovada]
]
>
				</description>
				<template>
					<![CDATA[Diretor solicita aprovação do reembolso ao usuário e devolução do valor solicitado.]
]
>
				</template>
				<template-language>text</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>20102</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>20102</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="pt_BR">
				Financeiro
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso aprovado pelo financeiro
					</label>
				</labels>
				<name>f43088f0-2510-4e8f-b268-e0f8bcbc8f80</name>
				<target>0040afd9-bae3-4b4a-b6fb-69232347963e</target>
				<default>true</default>
			</transition>
		</transitions>
	</task>
</workflow-definition>