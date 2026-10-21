Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580307;
	b=rk0kP6vqymI4zEyt7DhOGglscq5TBvHPLyERgCaN7BH2MAs/FVK6CUN7iW8FiZHY+Bq2
	 DMJxJxPs0+Rj3+2M6k6VS+FFnVXBc1CmAJoeOLkJ4wb+FAtwrHRUTv1V2fxmLQj2rY3X6
	 vULXNemdBz+ZL+7NlxlaCWs0znAEs6QgAchCBeXMRIDVt7rt/byvb61P7L5IE3Vvigxeh
	 CMU83jYGyVm5tjlfHRvu2RXbsJM7p8DyFJKZii9uSoWI+AxJWtP9LgGipOW6KTNvW2sTX
	 gyitEbJxLC4BPQud3r/LLnLJGeA+VTJcsXk+F3sp7FAwjzXntljxeGC3z+AuL3mwTfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KTOq9b7MMPkjtp1eVKOBCxDniMS+4VmsePLp64JihRU=;
	b=EU2xwd80fCaQMrK0zij2s8nDorXU7dadjbb/ZBky1fDqK3hwJ6rwBPEYrq9JBeykl9/T
	 z+pCn3l3rQgCMGiJIykynLcoeKbvMHHV4+QlDlmPhDqFJoRf/uQC6EqRluDBBe4wx6hkh
	 QXzq3amWjRYbDEXbFGah+Ud5cbN+jbzT65Ohm4guN65SKjllT/NN1bNDUVAusdtIwp+DZ
	 2pPGQXW1epAT6fqYcoDQxGGe7wH/8FC+Mx0CVd4JMfCzU8W6Oj4vViHTT7x6mnrvvp3Pp
	 TQ3/TkpZu+0BfwL3TYDM5F//RnEP72UevXsIVMskU7LrWvlbSTmrePverRfy0NRfyHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gKWexH2/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE8606A320
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gKWexH2/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ED51F000CA;
	Wed, 21 Oct 2026 10:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580307;
	bh=KTOq9b7MMPkjtp1eVKOBCxDniMS+4VmsePLp64JihRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gKWexH2/6gzluIjJsgBvTpI7maYYvEVtlqK88YKb2ofOWfzrNuAaKXbWy2cXL2ZBz
	 r782sgl3CnEF9gSAcAPUeFkKcB/s62VhhjuaM2jJKEMJgSK8pYybguO3hk7EzpKWll
	 XBIHyIbYgvQCq0ofDCNAYbvtBY8/V8+JrnJLXSNlHUoyZ3hiypNj8rcPyAlLeIfQbG
	 eTt0N7k6aPfy9ksnHF7USPj/ChYGYpT+sf1A/92Hj7QTEslveLysLEOR8QofYOljve
	 3JqyDTzDHBgLM5O4ooaOePuIu4c9g/5f/7Hmns1jpEjEMitZGaA9PTpMuBlmdCU3p0
	 NP/SR6Oa6VjBg==
Message-ID: <sashiko-outbox-180135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392
 PMIC keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-3-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-3-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:58:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Fabien Parent <parent.f@gmail.com>
>=20
> Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.
>=20
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D2

